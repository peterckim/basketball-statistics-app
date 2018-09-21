require 'nokogiri'
require 'open-uri'

class Game < ApplicationRecord
    has_many :player_games
    has_many :players, through: :player_games

    def self.get_player_game_info(url)
        page = Nokogiri::HTML(open(url))

        playerName = page.css('table').css('tbody').css('tr')[0].css('[data-stat="player"]').text.split(" ")
        gameDate = page.css('.scorebox').css('.scorebox_meta > div')[0].text
        parseGameDate = gameDate.split(", ")
        actualGameDate = "#{parseGameDate[1]}, #{parseGameDate[2]}"

        player_game_hash = {
            player: {
                first_name: playerName[0],
                last_name: playerName[1]
            },
            game: {
                home: page.css('.scorebox').css('[itemprop="performer"]')[0].css('[itemprop="name"]').text,
                away: page.css('.scorebox').css('[itemprop="performer"]')[1].css('[itemprop="name"]').text,
                home_score: page.css('.scorebox').css('.score')[0].text,
                away_score: page.css('.scorebox').css('.score')[1].text,
                date: actualGameDate
            },
            player_game: {
                field_goal_made: page.css('table').css('tbody').css('tr')[0].css('[data-stat="fg"]').text,
                field_goal_attempted: page.css('table').css('tbody').css('tr')[0].css('[data-stat="fga"]').text,
                free_throw_made: page.css('table').css('tbody').css('tr')[0].css('[data-stat="ft"]').text,
                free_throw_attempted: page.css('table').css('tbody').css('tr')[0].css('[data-stat="fta"]').text,
                three_point_made: page.css('table').css('tbody').css('tr')[0].css('[data-stat="fg3"]').text,
                three_point_attempted: page.css('table').css('tbody').css('tr')[0].css('[data-stat="fg3a"]').text,
                points: page.css('table').css('tbody').css('tr')[0].css('[data-stat="pts"]').text,
                rebounds: page.css('table').css('tbody').css('tr')[0].css('[data-stat="trb"]').text,
                assists: page.css('table').css('tbody').css('tr')[0].css('[data-stat="ast"]').text,
                steals: page.css('table').css('tbody').css('tr')[0].css('[data-stat="stl"]').text,
                blocks: page.css('table').css('tbody').css('tr')[0].css('[data-stat="blk"]').text,
                turnovers: page.css('table').css('tbody').css('tr')[0].css('[data-stat="tov"]').text,
            }
        }

        return player_game_hash
    end
end
