class WishlistsController < ApplicationController

    def show_wishlist
        @wishlist = current_user.profile.wishlist
    end

    def remove_item_on_wishlist_page
        wishlist_id = Profile.find(params[:id]).wishlist.id
        @wishlistproduct = WishlistProduct.where("wishlist_id = ? AND product_id = ?", wishlist_id, params[:product_id]).first
        @wishlistproduct.destroy
        redirect_to "/profiles/#{params[:id]}/show-wishlist"
    end

    def add_to_wishlist
        @wishlist = current_user.profile.wishlist
        product = Product.find(params[:product_id])
        @wishlist.products << product
        redirect_to "/products/#{params[:product_id]}"
    end

    def remove_wishlist_item
        wishlist_id = Profile.find(params[:id]).wishlist.id
        @wishlistproduct = WishlistProduct.where("wishlist_id = ? AND product_id = ?", wishlist_id, params[:product_id]).first
        @wishlistproduct.destroy
        redirect_to "/products/#{params[:product_id]}"
    end


end
