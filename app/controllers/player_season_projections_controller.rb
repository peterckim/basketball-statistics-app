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
    def new
        @projection = PlayerSeasonProjection.new
    end

    def create

    end

    def edit

    end

    def updated

    end
end
