class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :city
      t.string :name
      t.string :img
      

      t.timestamps
    end
  end
end
