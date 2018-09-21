class PlayersController < ApplicationController
    def index
        @players = Player.all
    end

    def show
        @player = Player.find_by(:id => params[:id])
    end

    def new
        @player = Player.new
    end

    def create
        player_hash = Player.get_player_info(params[:url])

        @player = Player.create(player_hash[:player])
        @season = Season.find_by(:year => 2018)


        @player_season = PlayerSeason.new(player_hash[:player_season])
        @player_season.player_id = @player.id
        @player_season.season_id = @season.id
        @player_season.save


        redirect_to players_path


    end
end
