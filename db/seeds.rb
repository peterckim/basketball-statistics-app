# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(:name => "Admin", :email => "admin@admin.com", :password => "mG3RsPQja7uwz6F", :admin => true)

Season.create(:year => 2018)

Player.create(:first_name => "LeBron", :last_name => "James", :position => "SF", :team => "Los Angeles Lakers")
PlayerSeason.create(:player_id => 1, :season_id => 1, :field_goal_percentage => 0.56, :free_throw_percentage => 0.72, :three_point_per_game => 1.2, :points_per_game => 25.7, :rebounds_per_game => 8.7, :assists_per_game => 7.6, :steals_per_game => 1.6, :blocks_per_game => 0.8, :turnovers_per_game => 3.5)

Player.create(:first_name => "Stephen", :last_name => "Curry", :position => "PG", :team => "Golden State Warriors")
PlayerSeason.create(:player_id => 2, :season_id => 1, :field_goal_percentage => 0.56, :free_throw_percentage => 0.72, :three_point_per_game => 1.2, :points_per_game => 25.7, :rebounds_per_game => 8.7, :assists_per_game => 7.6, :steals_per_game => 1.6, :blocks_per_game => 0.8, :turnovers_per_game => 3.5)

Player.create(:first_name => "James", :last_name => "Harden", :position => "SG", :team => "Houston Rockets")
PlayerSeason.create(:player_id => 3, :season_id => 1, :field_goal_percentage => 0.56, :free_throw_percentage => 0.72, :three_point_per_game => 1.2, :points_per_game => 25.7, :rebounds_per_game => 8.7, :assists_per_game => 7.6, :steals_per_game => 1.6, :blocks_per_game => 0.8, :turnovers_per_game => 3.5)

Player.create(:first_name => "Kevin", :last_name => "Durant", :position => "SF", :team => "Golden State Warriors")
PlayerSeason.create(:player_id => 4, :season_id => 1, :field_goal_percentage => 0.56, :free_throw_percentage => 0.72, :three_point_per_game => 1.2, :points_per_game => 25.7, :rebounds_per_game => 8.7, :assists_per_game => 7.6, :steals_per_game => 1.6, :blocks_per_game => 0.8, :turnovers_per_game => 3.5)

Player.create(:first_name => "Kawhi", :last_name => "Leonard", :position => "SF", :team => "Toronto Raptors")
PlayerSeason.create(:player_id => 5, :season_id => 1, :field_goal_percentage => 0.56, :free_throw_percentage => 0.72, :three_point_per_game => 1.2, :points_per_game => 25.7, :rebounds_per_game => 8.7, :assists_per_game => 7.6, :steals_per_game => 1.6, :blocks_per_game => 0.8, :turnovers_per_game => 3.5)

Player.create(:first_name => "Trae", :last_name => "Young", :position => "PG", :team => "Atlanta Hawks")
PlayerSeason.create(:player_id => 6, :season_id => 1, :field_goal_percentage => 0.56, :free_throw_percentage => 0.72, :three_point_per_game => 1.2, :points_per_game => 25.7, :rebounds_per_game => 8.7, :assists_per_game => 7.6, :steals_per_game => 1.6, :blocks_per_game => 0.8, :turnovers_per_game => 3.5)