class WelcomesController < ApplicationController

    def index 
        if current_user
            redirect_to dashboards_url 
        end 
    end 
end
