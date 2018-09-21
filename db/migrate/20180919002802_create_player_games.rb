class CreatePlayerGames < ActiveRecord::Migration[5.2]
  def change
    create_table :player_games do |t|
      t.integer :field_goal_made
      t.integer :field_goal_attempted
      t.integer :free_throw_made
      t.integer :free_throw_attempted
      t.integer :three_point_made
      t.integer :three_point_attempted
      t.integer :points
      t.integer :rebounds
      t.integer :assists
      t.integer :steals
      t.integer :blocks
      t.integer :turnovers
      
      t.belongs_to :player, index: true
      t.belongs_to :game, index: true
      t.timestamps
    end
  end
end
