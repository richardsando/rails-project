class ProductVariantPolicy < ApplicationPolicy

    def edit?
        @user.profile == @product.profile
    end

    def update?
        @user.profile == @product.profile
    end

    def new?
        @user.profile == @product.profile
    end
    
    def create?
        @user.profile == @product.profile
    end

    def destroy?
        @user.profile == @profile.profile
    end
    
end