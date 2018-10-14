# == Schema Information
#
# Table name: games
#
#   id                      :integer            not null, primary key
#   home                    :string
#   away                    :string
#   date                    :string
#   home_score              :integer
#   away_score              :integer
#   game_url                :string
#   created_at              :datetime           not null
#   updated_at              :datetime           not null
#

class Game < ApplicationRecord
    NBA_TEAMS = [
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

    has_many :player_games
    has_many :players, through: :player_games

    validates :home, presence: true
    validates :home, inclusion: { in: NBA_TEAMS }
    validates :away, presence: true
    validates :away, inclusion: { in: NBA_TEAMS }
    validates :date, presence: true

    def create_player_game
        game_service = GameService.new
        player_game_hash = game_service.get_player_game_info(self.game_url)

        self.update(player_game_hash[:game])

        player_game_hash[:players].each do |player_hash|
            player = Player.find_or_create_by(player_hash[:player])
            player_game = PlayerGame.new(player_hash[:player_game])
            player_game.player_id = player.id
            player_game.game_id = self.id
            player_game.save
        end
    end
end
