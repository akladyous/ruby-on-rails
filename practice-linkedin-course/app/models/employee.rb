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
class Employee < ApplicationRecord
    belongs_to :supervisor, class_name: 'Employee', optional: true
    has_many   :subordinates, class_name: "Employee", foreign_key: "supervisor_id"

    # default_scope { where(supervisor: nul) }
    default_scope { boss }
    scope :boss, -> { where(supervisor: nil)}
    scope :tutti, -> { unscope(where: :supervisor_id) }
    scope :dipendenti, -> { tutti.where.not(supervisor: nil) }
end

