class AddColumnInPlayerSeasonProjections < ActiveRecord::Migration[5.2]
  def change
    add_column :player_season_projections, :points_per_game, :float
  end
end
