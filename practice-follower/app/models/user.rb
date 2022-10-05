class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :trackable

  has_many :posts
  # users we are following
  has_many :friendships
  has_many :friends, -> { where friendships: { status: :pending } }, through: :friendships
  has_many :pending_friends, -> { where friendships: { status: :pending } }, through: :friendships, source: :friend
  has_many :requested_friends, -> { where friendships: { status: :requested } }, through: :friendships, source: :friend
  has_many :accepted_friends, -> { where friendships: { status: :accepted } }, through: :friendships, source: :friend
  has_many :blocked_friends, -> { where friendships: { status: :blocked } }, through: :friendships, source: :friend
end

# u1.followers.joins(:following_users).where(following_users: {status: :pending})
