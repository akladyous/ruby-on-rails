# == Schema Information
#
# Table name: countries
#
#  id         :integer          not null, primary key
#  active     :boolean          default(TRUE)
#  country    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Country < ApplicationRecord
    has_and_belongs_to_many :names
end
