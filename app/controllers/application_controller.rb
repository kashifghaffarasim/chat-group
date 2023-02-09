class ApplicationController < ActionController::Base


    
    private 

    def after_sign_in_path_for(resource)
        stored_location_for(resource) || dashboards_path
    end
end
