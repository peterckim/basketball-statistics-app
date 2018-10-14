class RemoveColumnInPlayerSeasonProjections < ActiveRecord::Migration[5.2]
  def change
    remove_column :player_season_projections, :points_per_pame
  end
end
