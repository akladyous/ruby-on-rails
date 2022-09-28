class Post < ApplicationRecord
  validates :title, :content, presence: true

  # after_update_commit { broadcast_replace_to('posts') }
  # after_destroy_commit { broadcast_remove_to('posts') }
  # after_create_commit do
  #     broadcast_append_to :posts,
  #     partial: "posts/post",
  #     locals: { post: self }
  # end
  broadcasts
end
