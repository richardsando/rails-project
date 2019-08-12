class ApplicationController < ActionController::Base
    before_action :store_user_location!, if: :storable_location?
    # The callback which stores the current location must be added before you authenticate the user 
    # as `authenticate_user!` (or whatever your resource is) will halt the filter chain and redirect 
    # before the location can be stored.
    # before_action :authenticate_user!

    include Pundit
    protect_from_forgery
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    private

    def user_not_authorized
        flash[:alert] = "You are not authorized to perform this action."
        redirect_to(request.referrer || root_path)
    end

    def active_cart(profile_id)
        return Profile.find(profile_id).carts.where("active_status = ?", true).first
    end

    def cart_total(cart_id)
        cart = Cart.find(cart_id)   #get the cart that the products belong to 
        total = 0.0
        cart.products_purchaseds.each do |purchased_product|
            total += purchased_product.purchase_QTY * ProductVariant.find(purchased_product.product_variant_id).price
        end
        return total
    end

    protected

    def after_sign_in_path_for(resource)
        if current_user.profile == nil
            new_profile_path
        else
            "/profiles/#{current_user.profile.id}"
        end
    end

      
    private
    # Its important that the location is NOT stored if:
    # - The request method is not GET (non idempotent)
    # - The request is handled by a Devise controller such as Devise::SessionsController as that could cause an 
    #    infinite redirect loop.
    # - The request is an Ajax request as this can lead to very unexpected behaviour.
    def storable_location?
      request.get? && is_navigational_format? && !devise_controller? && !request.xhr? 
    end

    def store_user_location!
      # :user is the scope we are authenticating
      store_location_for(:user, request.fullpath)
    end

#     def after_sign_in_path_for(resource_or_scope)
#         stored_location_for(resource_or_scope) || super
#     end

    # Overwriting the sign_out redirect path method
    def after_sign_out_path_for(resource_or_scope)
        # "/marvel"

        # if resource_or_scope == :user
        #     new_user_session_path
        # else
        #     root_path
        # end
        root_path
    end


end
