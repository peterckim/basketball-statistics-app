# == Schema Information
#
# Table name: player_games
#
#   id                      :integer            not null, primary key
#   player_id               :integer
#   game_id                 :integer
#   field_goal_made         :integer
#   field_goal_attempted    :integer
#   free_throw_made         :integer
#   free_throw_attempted    :integer
#   three_point_made        :integer
#   three_point_attempted   :integer
#   points                  :integer
#   rebounds                :integer
#   assists                 :integer
#   steals                  :integer
#   blocks                  :integer
#   turnovers               :integer
#   created_at              :datetime           not null
#   updated_at              :datetime           not null
#

class PlayerGame < ApplicationRecord
	belongs_to :player
	belongs_to :game
end
