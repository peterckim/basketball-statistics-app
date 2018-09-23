require 'nokogiri'
require 'open-uri'

class Player < ApplicationRecord
    has_many :player_games
    has_many :player_seasons
    has_many :player_season_projections
    has_many :games, through: :player_games
    has_many :seasons, through: :player_seasons

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :position, presence: true
    validate :full_name_is_unique

    def full_name_is_unique
        # Code HERE
    end
    

    def to_s
        self.first_name + " " + self.last_name
    end

    def find_player_season(year)
        season = Season.find_by_year(year)
        self.player_seasons.find {|i| i.season_id === season[0].id}
    end

    def self.scrape_and_add_player_to_database(url)

        player_hash = Player.get_player_info(url)

        player = Player.create(player_hash[:player])

        season = Season.find_by(:year => 2018)

        player_season = PlayerSeason.new(player_hash[:player_season])
        player_season.player_id = player.id
        player_season.season_id = season.id
        player_season.save


        return player


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
