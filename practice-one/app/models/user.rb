class User < ApplicationRecord
    has_and_belongs_to_many :mailing_lists


    belongs_to  :parent,        :class_name => "User"
    has_many    :childrens,     :class_name => "User", :foreign_key => "parent_id"

    has_many    :todos

    scope :senior, -> { where("age >= ?", 20)}
    scope :parenti, lambda { where(:parent => nil)}
    # Ex:- scope :active, lambda {where(:active => true)}
    # Ex:- scope :active, -> {where(:active => true)}
end
