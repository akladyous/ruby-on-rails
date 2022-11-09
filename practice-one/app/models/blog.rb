class Blog < ApplicationRecord
  belongs_to :user
  # belongs_to :author, class_name: 'User', foreign_key: :user_id
  # belongs_to :editor, class_name: 'User'
  # has_many :editors, class_name: 'Blog', foreign_key: :user_id
end
