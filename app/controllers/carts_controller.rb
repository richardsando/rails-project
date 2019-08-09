class CartsController < ApplicationController

    def showcart   
        @cart = current_user.profile.carts.where("active_status = ?", true).first   #gets the current active cart
    end

    def add_product_to_cart
        #accessible variables are: size_id, qty, and the id (profile) making the purchase
    
        @cart = active_cart(params[:id])   #get the active cart
    
        #need to find the product variant that we're going to add to the cart
        product_variant = ProductVariant.where("product_id = ? AND size_id = ?", params[:product_id], params[:size_id]).first
    
        if product_variant.stock_QTY - params[:qty].to_i < 0
          respond_to do |format|
            format.html {return redirect_to "/products/#{params[:product_id]}?product_size=#{params[:product_size]}", notice: "Sorry! You cannot add anymore #{product_variant.product.name} in size #{product_variant.size.sizing} as it is out of stock." }
          end
        end
    
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
          format.html {redirect_to "/products/#{params[:product_id]}?product_size=#{params[:product_size]}", notice: 'The item has been successfully added to your cart.' }
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

    def checkout_cart
        @checked_out_cart = Cart.find(params[:cart_id])
        @checked_out_cart.update_attribute(:active_status, false)   #make the old cart inactive
        Cart.create(profile_id: params[:id])  #and then give a new cart to that profile
    end

    def previous_orders
        @previous_orders = current_user.profile.carts.where("active_status = ?", false)
    end
end
