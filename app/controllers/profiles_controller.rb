class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy, :become_an_artist]

  def no_user
    respond_to do |format|
      format.html {redirect_to "/products/#{params[:product_id]}?product_size=#{params[:product_size]}", notice: 'Sorry, you need to sign in to add to cart.' }
    end
  end

  def no_user_for_wishlist
    respond_to do |format|
      format.html {redirect_to "/products/#{params[:product_id]}?product_size=#{params[:product_size]}", notice: 'Sorry, you need to sign in to add to wishlist.' }
    end
  end
 
  def become_an_artist
      authorize(@profile)
  end

  def become_artist_success

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
    # raise
  end

  # GET /profiles/new
  def new
    authorize(Profile)
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
    
    @profile = Profile.find(params[:id])
    authorize(@profile)
  
    # raise
  end

  # POST /profiles
  # POST /profiles.json
  def create
    authorize(Profile)
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
    authorize(@profile)
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
    authorize(@profile)
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
