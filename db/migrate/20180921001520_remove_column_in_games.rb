class RemoveColumnInGames < ActiveRecord::Migration[5.2]
  def change
    remove_column :games, :winner
    remove_column :games, :loser
  end
end
