# == Schema Information
#
# Table name: player_seasons
#
#   id                      :integer            not null, primary key
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

class PlayerSeason < ApplicationRecord
    belongs_to :player
    belongs_to :season

    def add_to_averages_for_season
        
    end
end
