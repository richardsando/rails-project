class ProfilePolicy < ApplicationPolicy
    attr_reader :user, :profile

    def initialize(user, profile)
      @user = user
      @profile = profile
    end

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

    def become_an_artist?
        @user.profile == @profile
    end

end