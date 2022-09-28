class Category < ApplicationRecord
    has_many :products

    belongs_to  :parent,        :class_name => "Category", :optional => true
    has_many    :subcategories, :class_name => "Category", :foreign_key => "parent_id"

    belongs_to :section
    scope :roots, lambda { where(:parent_id => nil)}
    # Ex:- scope :active, lambda {where(:active => true)}
end
