class ListingLost < ApplicationRecord
  belongs_to :listing
  belongs_to :lost
end
