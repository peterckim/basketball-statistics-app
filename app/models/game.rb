require 'nokogiri'
require 'open-uri'

class Game < ApplicationRecord
    has_many :player_games
    has_many :players, through: :player_games

    validates :home, presence: true
    validates :away, presence: true
    validates :date, presence: true
    validate :home_must_be_real_nba_team
    validate :away_must_be_real_nba_team

    def home_must_be_real_nba_team
        nba_teams = [
            "Atlanta Hawks",
            "Boston Celtics",
            "Brooklyn Nets",
            "Charlotte Hornets",
            "Chicago Bulls",
            "Cleveland Cavaliers",
            "Dallas Mavericks",
            "Denver Nuggets",
            "Detroit Pistons",
            "Golden State Warriors",
            "Houston Rockets",
            "Indiana Pacers",
            "Los Angeles Clippers",
            "Los Angeles Lakers",
            "Memphis Grizzlies",
            "Miami Heat",
            "Milwaukee Bucks",
            "Minnesota Timberwolves",
            "New Orleans Pelicans",
            "New York Knicks",
            "Oklahoma City Thunder",
            "Orlando Magic",
            "Philadelphia 76ers",
            "Phoenix Suns",
            "Portland Trail Blazers",
            "Sacramento Kings",
            "San Antonio Spurs",
            "Toronto Raptors",
            "Utah Jazz",
            "Washington Wizards"
        ]

        if !nba_teams.include?(home)
            errors.add(:home, "must be a real NBA team")
        end
    end

    def away_must_be_real_nba_team
        nba_teams = [
            "Atlanta Hawks",
            "Boston Celtics",
            "Brooklyn Nets",
            "Charlotte Hornets",
            "Chicago Bulls",
            "Cleveland Cavaliers",
            "Dallas Mavericks",
            "Denver Nuggets",
            "Detroit Pistons",
            "Golden State Warriors",
            "Houston Rockets",
            "Indiana Pacers",
            "Los Angeles Clippers",
            "Los Angeles Lakers",
            "Memphis Grizzlies",
            "Miami Heat",
            "Milwaukee Bucks",
            "Minnesota Timberwolves",
            "New Orleans Pelicans",
            "New York Knicks",
            "Oklahoma City Thunder",
            "Orlando Magic",
            "Philadelphia 76ers",
            "Phoenix Suns",
            "Portland Trail Blazers",
            "Sacramento Kings",
            "San Antonio Spurs",
            "Toronto Raptors",
            "Utah Jazz",
            "Washington Wizards"
        ]

        if !nba_teams.include?(away)
            errors.add(:away, "must be a real NBA team")
        end
    end

    def create_player_game

        player_game_hash = self.get_player_game_info(self.game_url)

        self.update(player_game_hash[:game])

        player_game_hash[:players].each do |player_hash|
            player = Player.find_or_create_by(player_hash[:player])
            player_game = PlayerGame.new(player_hash[:player_game])
            player_game.player_id = player.id
            player_game.game_id = self.id
            player_game.save
        end
    end

    def get_player_game_info(url)
        page = Nokogiri::HTML(open(url))

        gameDate = page.css('.scorebox').css('.scorebox_meta > div')[0].text
        parseGameDate = gameDate.split(", ")
        actualGameDate = "#{parseGameDate[1]}, #{parseGameDate[2]}"

        player_game_hash = {
            game: {
                home: page.css('.scorebox').css('[itemprop="performer"]')[0].css('[itemprop="name"]').text,
                away: page.css('.scorebox').css('[itemprop="performer"]')[1].css('[itemprop="name"]').text,
                home_score: page.css('.scorebox').css('.score')[0].text,
                away_score: page.css('.scorebox').css('.score')[1].text,
                date: actualGameDate
            },
            players: []
        }
        
        tableArray = page.css('table').to_a

        tableArray.select! do |table|
            table.attribute("id").text.include? "basic"
        end

        tableArray.each do |table|
            playerArray = table.css('tbody').css('tr').to_a
            playerArray.delete_at(5)

            playerArray.each do |playerObject|
                playerName = playerObject.css('[data-stat="player"]').text.split(" ")
                player_game_attribute_hash = {
                    player: {
                        first_name: playerName[0],
                        last_name: playerName[1]
                    },
                    player_game: {
                        field_goal_made: playerObject.css('[data-stat="fg"]').text.to_i,
                        field_goal_attempted: playerObject.css('[data-stat="fga"]').text.to_i,
                        free_throw_made: playerObject.css('[data-stat="ft"]').text.to_i,
                        free_throw_attempted: playerObject.css('[data-stat="fta"]').text.to_i,
                        three_point_made: playerObject.css('[data-stat="fg3"]').text.to_i,
                        three_point_attempted: playerObject.css('[data-stat="fg3a"]').text.to_i,
                        points: playerObject.css('[data-stat="pts"]').text.to_i,
                        rebounds: playerObject.css('[data-stat="trb"]').text.to_i,
                        assists: playerObject.css('[data-stat="ast"]').text.to_i,
                        steals: playerObject.css('[data-stat="stl"]').text.to_i,
                        blocks: playerObject.css('[data-stat="blk"]').text.to_i,
                        turnovers: playerObject.css('[data-stat="tov"]').text.to_i
                    }
                }
    
                player_game_hash[:players] << player_game_attribute_hash
            end
        end

        return player_game_hash
    end

end
