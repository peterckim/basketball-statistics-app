class AddColumnInPlayerSeasons < ActiveRecord::Migration[5.2]
  def change
    add_column :player_seasons, :points_per_game, :float
  end
end
