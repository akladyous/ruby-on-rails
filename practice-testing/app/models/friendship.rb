class Friendship < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :followed, class_name: 'User'

  validates :follower, :followed, presence: true

  enum status: { pending: 0, requested: 1, accepted: 2, blocked: 3 }
end
