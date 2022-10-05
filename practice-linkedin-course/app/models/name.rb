# == Schema Information
#
# Table name: names
#
#  id         :integer          not null, primary key
#  contatore  :decimal(5, 2)
#  first_name :string           not null
#  last_name  :string(50)
#  nick_name  :string
#  prova      :text(10)
#  qty        :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  by_first_name  (first_name)
#
class Name < ApplicationRecord
    has_and_belongs_to_many :countries
end
