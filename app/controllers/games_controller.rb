class GamesController < ApplicationController
    def index
        @games = Game.all
    end

    def show
        @game = Game.find_by(:id => params[:id])
    end

    def new
        @game = Game.new
    end

    def create
        @game = Game.find_or_create_by(:game_url => params[:game_url])
        @game.create_player_game
        


        redirect_to players_path


    end
end
