class Found < ApplicationRecord
    has_one :listing_found
    has_one :listing, through: :listing_found
end
