class User < ApplicationRecord

  has_many :photos
  has_many :orders
  has_many :comments, -> { extending FindRecentExtension }
  has_one  :address
end
