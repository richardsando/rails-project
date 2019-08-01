class ApplicationController < ActionController::Base

    protected

    def after_sign_in_path_for(resource)
        if current_user.profile == nil
            new_profile_path
        else
            "/profiles/#{current_user.profile.id}"
        end
    end
  
    def after_sign_out_path_for(resource)
        "/"
      # return the path based on resource
    end


end
