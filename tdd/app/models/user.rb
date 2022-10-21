class User < ApplicationRecord
  validates_presence_of :first_name, :last_name, :email
  validates_uniqueness_of :email
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_uniqueness_of :email, case_sensitive: true

  scope :active_users, -> { where(active: true) }
  scope :inactive_users, -> { where(active: false) }
end
