class RemoveColumnInPlayerSeasons < ActiveRecord::Migration[5.2]
  def change
    remove_column :player_seasons, :points_per_pame
  end
end
