class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable

  def deleted?
    user.nil?
  end

  def destry
    user(user:nil, comment: nil)
  end
end
