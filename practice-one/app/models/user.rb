class User < ApplicationRecord
  # has_many :posts, -> { where.not(published_at: nil) }, class_name: 'Post'
  has_many :likes, dependent: :destroy
  has_many :infos, dependent: :destroy
  has_many :posts
  # has_many :liked_posts, through: :likes, sourcze: :postb1

  # has_many :comments, as: :commentable

  has_many :blogs
  # has_many :authored_posts, foreign_key: :user_id, class_name: 'Blog'
  # has_many :edited_posts, foreign_key: :user_id, class_name: 'Blog'



  # has_many :posts, after_add: :capitalize_title
  def capitalize_title(post)
    debugger
    # self.title.capitalize
  end

  validates :email, presence: true

end
# SELECT "posts".* FROM "posts"
# INNER JOIN "likes" ON "posts"."id" = "likes"."post_id"
# WHERE "likes"."user_id" = $1  [["user_id", 1]]
