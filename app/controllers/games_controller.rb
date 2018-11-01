# == Schema Information
#
# Table name: games
#
#   id                      :integer            not null, primary key
#   home                    :string
#   away                    :string
#   date                    :string
#   home_score              :integer
#   away_score              :integer
#   game_url                :string
#   created_at              :datetime           not null
#   updated_at              :datetime           not null
#

class GamesController < ApplicationController
	before_action :require_login

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
