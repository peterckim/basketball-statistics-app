class WelcomeController < ApplicationController
    def home
        if session[:user_id]
            redirect_to seasons_path
        end
    end
end
