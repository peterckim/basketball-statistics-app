class AddColumnInPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :player_url, :string
  end
end
