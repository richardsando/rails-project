class ProfilePolicy < ApplicationPolicy
    attr_reader :user, :profile

    def initialize(user, profile)
      @user = user
      @profile = profile
    end

    def edit?
        @user && @user.profile == @profile
    end

    def update?
        @user && @user.profile == @profile
    end

    def new?
       @user && @user.profile == nil
    end
    
    def create?
      @user && @user.profile == nil
    end

    def destroy?
       @user &&  @user.profile == @profile
    end

    def become_an_artist?
       @user && @user.profile == @profile
    end

    def showcart
      @user &&  @user.profile == @profile
    end
end