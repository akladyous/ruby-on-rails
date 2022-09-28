class Lost < ApplicationRecord
    has_one :listing_lost, dependent: :destroy
    has_one :listing, through: :listing_lost
end
