class CreateTeamSeasons < ActiveRecord::Migration[5.2]
  def change
    create_table :team_seasons do |t|
      t.integer :games_won
      t.integer :games_lost
      t.timestamps
    end
  end
end
