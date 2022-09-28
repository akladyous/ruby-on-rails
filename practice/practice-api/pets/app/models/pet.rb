class Pet < ApplicationRecord
    has_one :listing
    has_one :user, through: :listing
end
