class User < ApplicationRecord
  # has_many :posts, -> { where.not(published_at: nil) }, class_name: 'Post'
  has_many :posts, after_add: :capitalize_title

  def capitalize_title(post)
    debugger
    # self.title.capitalize
  end
end
