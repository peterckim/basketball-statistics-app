# == Schema Information
#
# Table name: players
#
#   id                  :integer            not null, primary key
#   first_name          :string     
#   last_name           :string
#   position            :string
#   team                :string
#   player_url          :string
#   created_at          :datetime           not null
#   updated_at          :datetime           not null
#

class PlayersController < ApplicationController
    before_action :require_login
    
    def index
        @season = Season.find_by(:id => params[:season_id])
        @players = Player.all
    end

    def show
        @player = Player.find_by(:id => params[:id])
        @player_season = @player.find_player_season(params[:season_id].to_i + 2017)
    end

    def new
        @player = Player.new
    end

    def create
        @player = Player.scrape_and_add_player_to_database(params[:player][:player_url])


        redirect_to players_path
    end
end
