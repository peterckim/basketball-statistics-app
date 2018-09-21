class CreatePlayerSeasons < ActiveRecord::Migration[5.2]
  def change
    create_table :player_seasons do |t|
      t.float :field_goal_percentage
      t.float :free_throw_percentage
      t.float :three_point_per_game
      t.float :points_per_pame
      t.float :rebounds_per_game
      t.float :assists_per_game
      t.float :steals_per_game
      t.float :blocks_per_game
      t.float :turnovers_per_game

      t.belongs_to :player, index: true
      t.belongs_to :season, index: true
      t.timestamps
    end
  end
end
