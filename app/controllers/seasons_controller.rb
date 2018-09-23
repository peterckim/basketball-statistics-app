class SeasonsController < ApplicationController
    def index
        @seasons = Season.all
    end

    def show
        @season = Season.find_by(:id => params[:id])
    end
end
