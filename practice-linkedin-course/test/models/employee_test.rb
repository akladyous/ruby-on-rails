# == Schema Information
#
# Table name: employees
#
#  id            :integer          not null, primary key
#  branch        :string
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  supervisor_id :integer
#
# Indexes
#
#  index_employees_on_supervisor_id  (supervisor_id)
#
require "test_helper"

class EmployeeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
