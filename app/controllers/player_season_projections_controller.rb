# == Schema Information
#
# Table name: player_seasons_projections
#
#   id                      :integer            not null, primary key
#   user_id                 :integer
#   player_id               :integer
#   season_id               :integer
#   field_goal_percentage   :float
#   free_throw_percentage   :float
#   three_point_per_game    :float
#   points_per_game         :float
#   rebounds_per_game       :float
#   assists_per_game        :float
#   steals_per_game         :float
#   blocks_per_game         :float
#   turnovers_per_game      :float
#   created_at              :datetime           not null
#   updated_at              :datetime           not null
#

class PlayerSeasonProjectionsController < ApplicationController
	before_action :set_projection, only: [:edit, :update]

	def new
		@projection = PlayerSeasonProjection.new
	end

	def create
		@projection = PlayerSeasonProjection.find_or_create_by(projection_params)
		redirect_to season_players_path(2)
	end

	def edit

	end

	def update
		@project.update(projection_params)
	end

	private

	def set_projection
		@projection = PlayerSeasonProjection.find(params[:id])
	end

	def projection_params
		params.require(:projection).permit(:field_goal_percentage, :free_throw_percentage, :three_point_per_game, :points_per_game, :rebounds_per_game, :assists_per_game, :steals_per_game, :blocks_per_game, :turnovers_per_game)
	end
end
