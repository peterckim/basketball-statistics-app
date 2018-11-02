# == Schema Information
#
# Table name: players
#
#   id                  :integer            not null, primary key
#   first_name          :string     
#   last_name           :string
#   position            :string
#   team                :string
#   player_url          :string
#   created_at          :datetime           not null
#   updated_at          :datetime           not null
#

class Player < ApplicationRecord
    has_many :player_games
    has_many :player_seasons
    has_many :player_season_projections
    has_many :games, through: :player_games
    has_many :seasons, through: :player_seasons

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :position, presence: true
    validates :position, inclusion: { in: %w(PG SG SF PF C) }

    scope :to_graph, -> (season) { joins(:player_seasons).where('season_id = ? AND player_seasons.graph = ?', season.id, true) }
    
    def to_s
        self.first_name + " " + self.last_name
    end

    def find_player_season(year)
        season = Season.find_by_year(year)
        self.player_seasons.find {|i| i.season_id === season[0].id}
    end

    def self.scrape_and_add_player_to_database(url)
        player_service = PlayerService.new

        player_hash = player_service.get_player_info(url)

        player = Player.create(player_hash[:player])

        season = Season.find_by(:year => 2018)

        player_season = PlayerSeason.new(player_hash[:player_season])
        player_season.player_id = player.id
        player_season.season_id = season.id
        player_season.save

        return player
    end

    def self.players_to_graph
        where("graph = ?", true)
    end

    def self.players_to_project
        where("projection = ?", true)
    end

    def graph?
        self.graph == true
    end

    def projection?
        self.projection == true
    end
end
