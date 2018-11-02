class AddGraphToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :graph, :boolean, default: false
  end
end
