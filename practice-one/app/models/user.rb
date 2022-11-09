class User < ApplicationRecord
  # has_many :posts, -> { where.not(published_at: nil) }, class_name: 'Post'
  has_many :likes, dependent: :destroy
  has_many :infos, dependent: :destroy
  has_many :blogs
  has_many :posts
  has_many :liked_posts, through: :likes, source: :post


  # has_many :posts, after_add: :capitalize_title
  def capitalize_title(post)
    debugger
    # self.title.capitalize
  end
end
# SELECT "posts".* FROM "posts"
# INNER JOIN "likes" ON "posts"."id" = "likes"."post_id"
# WHERE "likes"."user_id" = $1  [["user_id", 1]]
