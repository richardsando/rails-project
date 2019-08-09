class ProfilePolicy < ApplicationPolicy

    def edit?
        @user.profile == @profile
    end

    def update?
        @user.profile == @profile
    end

    def new?
        @user.profile == nil
    end
    
    def create?
        @user.profile == nil
    end

    def destroy?
        @user.profile == @profile
    end

    def become_artist
        @user.profile == @profile
    end


end