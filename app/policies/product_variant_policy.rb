class ProductVariantPolicy < ApplicationPolicy


    def initialize(user, product_variant)
        @user = user
        @product_variant = product_variant
      end

    def edit?
        @user.profile == @product_variant.product.profile
    end

    def update?
        @user.profile == @product_variant.product.profile
    end

    def new?
        @user && @user.role.id == 2 && @product.profile.user == @user
    end
    
    def create?
        @user.profile == @product.profile
    end

    def destroy?
        @user.profile == @product_variant.product.profile
    end
    
end