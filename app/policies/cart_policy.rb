class ProductPolicy < ApplicationPolicy

    def show
    end

    def edit?
        @user.profile == @cart.profile
    end

    def update?
        @user.profile == @cart.profile
    end

    def new?
        @user.profile == @cart.profile
    end
    
    def create?
        @user.profile == @cart.profile
    end

    def destroy?
        @user.profile == @profile.profile
    end
    
end