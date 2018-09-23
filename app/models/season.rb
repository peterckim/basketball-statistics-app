class Season < ApplicationRecord
    has_many :player_seasons
    has_many :player_season_projections
    has_many :players, through: :player_seasons
    
    def self.find_by_year(year)
        where("year = ?", year)
    end
end
