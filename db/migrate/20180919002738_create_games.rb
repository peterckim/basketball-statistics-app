class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :home
      t.string :away
      t.string :winner
      t.string :loser
      t.timestamps
    end
  end
end
