class PlayerSeason < ApplicationRecord
    belongs_to :player
    belongs_to :season

    def add_to_averages_for_season
        
    end
end
