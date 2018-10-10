# == Schema Information
#
# Table name: seasons
#
#   id                  :integer            not null, primary key
#   year                :integer
#   created_at          :datetime           not null
#   updated_at          :datetime           not null
#

class Season < ApplicationRecord
    has_many :player_seasons
    has_many :player_season_projections
    has_many :players, through: :player_seasons
    
    def self.find_by_year(year)
        where("year = ?", year)
    end
end
