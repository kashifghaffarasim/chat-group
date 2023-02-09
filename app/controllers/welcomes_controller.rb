class WelcomesController < ApplicationController

    def index 
        if current_user
            redirect dashboards_url 
        end 
    end 
end
