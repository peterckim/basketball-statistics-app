class AddGraphToPlayerSeasons < ActiveRecord::Migration[5.2]
  def change
    add_column :player_seasons, :graph, :boolean, default: false
  end
end
