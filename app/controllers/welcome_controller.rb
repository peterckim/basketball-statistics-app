class WelcomeController < ApplicationController
    def home
        if session[:user_id]
            redirect_to players_path
        end
    end
end