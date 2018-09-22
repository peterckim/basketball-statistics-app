class PlayerSeasonProjection < ApplicationRecord
    belongs_to :user
    belongs_to :player
    belongs_to :season
end
