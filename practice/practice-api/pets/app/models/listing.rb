class Listing < ApplicationRecord
    belongs_to :user
    belongs_to :pet

    has_one :listing_lost, dependent: :destroy
    has_one :lost, through: :listing_lost, dependent: :destroy

    has_one :listing_found, dependent: :destroy
    has_one :found, through: :listing_found, dependent: :destroy
end
