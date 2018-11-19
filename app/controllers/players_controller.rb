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
    @players = Player.asc
        

	@players_to_graph = Player.players_to_graph
	
	@projections_to_graph = PlayerSeasonProjection.projections_to_graph

    graph = {
      :players => [

      ]
    }

    @players_to_graph.each do |p|
      graph[:players] << {
		name: p.to_s,
		fieldGoalPercentage: p.player_seasons.first.field_goal_percentage,
		freeThrowPercentage: p.player_seasons.first.free_throw_percentage,
		threePointPerGame: p.player_seasons.first.three_point_per_game,
		pointsPerGame: p.player_seasons.first.points_per_game,
		reboundsPerGame: p.player_seasons.first.rebounds_per_game,
		assistsPerGame: p.player_seasons.first.assists_per_game,
		stealsPerGame: p.player_seasons.first.steals_per_game,
		blocksPerGame: p.player_seasons.first.blocks_per_game,
		turnoversPerGame: p.player_seasons.first.turnovers_per_game
      }
	end
	
	@projections_to_graph.each do |projection|
		graph[:players] << {
			name: projection.player.projection_to_s,
			fieldGoalPercentage: projection.field_goal_percentage,
			freeThrowPercentage: projection.free_throw_percentage,
			threePointPerGame: projection.three_point_per_game,
			pointsPerGame: projection.points_per_game,
			reboundsPerGame: projection.rebounds_per_game,
			assistsPerGame: projection.assists_per_game,
			stealsPerGame: projection.steals_per_game,
			blocksPerGame: projection.blocks_per_game,
			turnoversPerGame: projection.turnovers_per_game
		}
	end

    gon.final_graph = graph.to_json
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

	def update
		binding.pry
		@player = Player.find(params[:id])
		season = Season.find(params[:season_id])

		if params[:player][:graph]
			if params[:player][:graph] === "0"
				@player.projection = false
			end

			@player.graph = params[:player][:graph]
		end

		if params[:player][:projection]
			@player.projection = params[:player][:projection]
		end

		@player.save

		redirect_to season_players_path(season)
	end 
end
