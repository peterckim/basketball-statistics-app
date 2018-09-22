require 'nokogiri'
require 'open-uri'

class Player < ApplicationRecord
    has_many :player_games
    has_many :player_seasons
    has_many :player_season_projections
    has_many :games, through: :player_games
    has_many :seasons, through: :player_seasons
    

    def to_s
        self.first_name + " " + self.last_name
    end

    def self.get_player_info(url)
        page = Nokogiri::HTML(open(url))
        playerName = page.css('h1').css('[itemprop="name"]').text.split(" ")
        player_hash = {
            player: {
                first_name: playerName[0],
                last_name: playerName[1],
                position: page.css('#per_game\.2018').css('[data-stat="pos"]').text,
                team: page.css('#per_game\.2018').css('[data-stat="team_id"]').text
            },
            player_season: {
                field_goal_percentage: page.css('#per_game\.2018').css('[data-stat="fg_pct"]').text,
                free_throw_percentage: page.css('#per_game\.2018').css('[data-stat="ft_pct"]').text,
                three_point_per_game: page.css('#per_game\.2018').css('[data-stat="fg3_per_g"]').text,
                points_per_game: page.css('#per_game\.2018').css('[data-stat="pts_per_g"]').text,
                rebounds_per_game: page.css('#per_game\.2018').css('[data-stat="trb_per_g"]').text,
                assists_per_game: page.css('#per_game\.2018').css('[data-stat="ast_per_g"]').text,
                steals_per_game: page.css('#per_game\.2018').css('[data-stat="stl_per_g"]').text,
                blocks_per_game: page.css('#per_game\.2018').css('[data-stat="blk_per_g"]').text,
                turnovers_per_game: page.css('#per_game\.2018').css('[data-stat="tov_per_g"]').text
            }
        }

        return player_hash
    end
end
