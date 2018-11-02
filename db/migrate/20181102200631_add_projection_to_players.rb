class AddProjectionToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :projection, :boolean, default: false
  end
end
