class User < ApplicationRecord
  # has_many :posts, -> { where.not(published_at: nil) }, class_name: 'Post'
  has_many :likes, dependent: :destroy
  has_many :infos, dependent: :destroy
  has_many :posts
  # has_many :liked_post, through: :likes, resource: :post

  # has_many :posts, after_add: :capitalize_title
  def capitalize_title(post)
    debugger
    # self.title.capitalize
  end
end
