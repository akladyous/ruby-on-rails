class Post < ApplicationRecord
  belongs_to :author

  delegate :name, to: :author, prefix: true, allow_nil: true
end
