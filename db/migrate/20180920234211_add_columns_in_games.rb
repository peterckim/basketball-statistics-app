class AddColumnsInGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :game_url, :string
    add_column :games, :date, :string
  end
end
