class ProductPolicy < ApplicationPolicy
    attr_reader :user, :product

    def initialize(user, product)
      @user = user
      @product = product
    end

    def edit?
        @user.profile == @product.profile
    end

    def update?
        @user.profile == @product.profile
    end

    def new?
        @user && @user.role.id == 2
        # @user.profile == @product.profile
        # raise
    end
    
    def create?
        @user.profile == @product.profile
    end

    def destroy?
        @user.profile == @product.profile
    end

end