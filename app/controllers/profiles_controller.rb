class ProfilesController < ApplicationController
  # before_action :set_profile, only: [:show, :edit, :update, :destroy]
  require "mini_magick"


  def show_wishlist
    @wishlist = current_user.profile.wishlist
  end

  def remove_item_on_wishlist_page
    wishlist_id = Profile.find(params[:id]).wishlist.id
    @wishlistproduct = WishlistProduct.where("wishlist_id = ? AND product_id = ?", wishlist_id, params[:product_id]).first
    @wishlistproduct.destroy
    redirect_to "/profiles/#{params[:id]}/show-wishlist"
  end

  #maybe just add a flag to say what page you came from, so you know where to redirect_to
  def add_to_wishlist
    @wishlist = current_user.profile.wishlist
    product = Product.find(params[:product_id])
    @wishlist.products << product
    # need to redirect back to the same product and have a notice rendering success 
    redirect_to "/products/#{params[:product_id]}"

    #this one redirects you straight to the wishlist
    # redirect_to "/profiles/#{params[:id]}/show-wishlist"
  end

  def remove_wishlist_item
    wishlist_id = Profile.find(params[:id]).wishlist.id
    @wishlistproduct = WishlistProduct.where("wishlist_id = ? AND product_id = ?", wishlist_id, params[:product_id]).first
    @wishlistproduct.destroy

    #need to redirect back to the item 
    redirect_to "/products/#{params[:product_id]}"

    #this one redirects you straight to the wishlist
    # redirect_to "/profiles/#{params[:id]}/show-wishlist"
  end

  def showcart
    @cart = current_user.profile.carts.where("active_status = ?", true).first   #gets the current active cart
  end

  def add_product_to_cart
    #accessible variables are: size_id, qty, and the id (profile) making the purchase

    @cart = active_cart(params[:id])   #get the active cart

    #need to find the product variant that we're going to add to the cart
    product_variant = ProductVariant.where("product_id = ? AND size_id = ?", params[:product_id], params[:size_id]).first

    if @cart.product_variants.where(id: product_variant.id).exists?
      #then find the purchase entry and update the purchase_QTY
      purchase_entry = ProductsPurchased.where(cart_id: @cart.id, product_variant_id: product_variant.id).first
      updated_purchase_QTY = purchase_entry.purchase_QTY + params[:qty].to_i
      purchase_entry.update_attribute(:purchase_QTY, updated_purchase_QTY)
    else
      #its a new entry in the cart
      @cart.product_variants << product_variant
      ProductsPurchased.where(cart_id: @cart.id, product_variant_id: product_variant.id).first.update_attribute(:purchase_QTY, params[:qty])
    end

    #now decrease the stock of the product variant 
    new_stock_amount = product_variant.stock_QTY - params[:qty].to_i
    product_variant.update_attribute(:stock_QTY, new_stock_amount)
    
    respond_to do |format|
      format.html {redirect_to "/products/#{params[:product_id]}?fit=#{params[:fit]}", notice: 'The item has been successfully added to your cart.' }
    end
  end

  def change_item_qty
    purchase_entry = ProductsPurchased.find(params[:purchase_id])
    product_variant = ProductVariant.find(purchase_entry.product_variant_id)

    params[:function] == "increment" ? increment=1 : increment=-1
    new_purchase_qty = purchase_entry.purchase_QTY + increment
    new_stock_QTY = product_variant.stock_QTY - increment

    if new_stock_QTY < 0
      respond_to do |format|
        format.html {return redirect_to "/profiles/#{params[:id]}/showcart", notice: "Sorry! You cannot add anymore #{product_variant.product.name} in size #{product_variant.size.sizing} as it is out of stock." }
      end
    end

    purchase_entry.update_attribute(:purchase_QTY, new_purchase_qty)
    product_variant.update_attribute(:stock_QTY, new_stock_QTY)
    
    redirect_to "/profiles/#{params[:id]}/showcart"
  end

  def add_to_cart #THIS IS WHERE ID MAKE THE NEW product purchased INSTANCE
    @cart = current_user.profile.carts.where("active_status = ?", true).first   #get the active cart
    product = Product.find(params[:product_id])
    @cart.products << product

    respond_to do |format|
      format.html {redirect_to "/products/#{params[:product_id]}", notice: 'The item has been successfully added to your cart.' }
    end
    #this one redirects to the cart
  
    # redirect_to "/profiles/#{params[:id]}/showcart"

  end

  def remove_cart_item

    cart_id = active_cart(params[:id]).id   
    @product_purchased = ProductsPurchased.where("cart_id = ? AND product_variant_id = ?", cart_id, params[:product_variant_id]).first
    quantity = @product_purchased.purchase_QTY

    #replenish the stock since the item was removed from the cart
    restock_product = ProductVariant.find(params[:product_variant_id])
    new_stock_amount = restock_product.stock_QTY + quantity
    restock_product.update_attribute(:stock_QTY, new_stock_amount)

    @product_purchased.destroy
    
    respond_to do |format|
      format.html {redirect_to "/profiles/#{params[:id]}/showcart", notice: 'Item removed from cart.' }
    end

  end
 
  def become_an_artist
    current_user.update(role_id: 2)
  end
  
  def checkout_cart
    @checked_out_cart = Cart.find(params[:cart_id])
    @checked_out_cart.update_attribute(:active_status, false)   #make the old cart inactive
    Cart.create(profile_id: params[:id])  #and then give a new cart to that profile
  end

  def previous_orders
    @previous_orders = current_user.profile.carts.where("active_status = ?", false)
  end


  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @profile = Profile.find(params[:id])
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
    @profile = Profile.find(params[:id])
  end

  # POST /profiles
  # POST /profiles.json
  def create
    
    @profile = Profile.new(profile_params)
    respond_to do |format|
      if @profile.save 
        @cart = Cart.create(profile_id: @profile.id)       #create an active cart with the creation of the profile - check
        @wishlist = Wishlist.create(profile_id: @profile.id) #create the one wishlist that the user always has 
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    @profile = Profile.find(params[:id])
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:username, :about, :location, :joindate, :user_id, :avatar, :cover_image)
    end
end
