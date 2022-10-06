class Post < ApplicationRecord
  has_many :comments, as: :commentable
  validates :title, :content, presence: true
end
