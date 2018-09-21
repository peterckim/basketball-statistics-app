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

        player_game_hash = Game.get_player_game_info(@game.game_url)

        @player = Player.find_or_create_by(:first_name => player_game_hash[:player][:first_name], :last_name => player_game_hash[:player][:last_name])
        @game.update(player_game_hash[:game])


        @player_game = PlayerGame.new(player_game_hash[:player_game])
        @player_game.player_id = @player.id
        @player_game.game_id = @game.id
        @player_game.save


        redirect_to players_path


    end
end
