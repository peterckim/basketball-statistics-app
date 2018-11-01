class Team < ApplicationRecord
    has_many :seasons
    has_many :players, through: :seasons
end
