class Post < ApplicationRecord
  belongs_to :user
  has_many   :likes, dependent: :destroy

  # belongs_to :author, class_name: "User", foreign_key: :user_id
  # belongs_to :editor, class_name: "User", foreign_key: :user_id
end
