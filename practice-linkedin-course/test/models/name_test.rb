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
require "test_helper"

class NameTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end