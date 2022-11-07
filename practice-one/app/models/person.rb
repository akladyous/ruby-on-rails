class Person < ApplicationRecord
  has_and_belongs_to_many :infos

  validates :first_name, presence: true
end
