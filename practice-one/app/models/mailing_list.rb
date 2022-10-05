class MailingList < ApplicationRecord
    has_and_belongs_to_many :users

    scope :subscribed, -> { where(:subscribe => true)}
    # Ex:- scope :active, -> {where(:active => true)}
end
