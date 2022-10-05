require_relative '20220415164810_add_full_name_to_names'

class RevertAddFullName < ActiveRecord::Migration[7.0]
  def change
    revert AddFullNameToNames
  end
end
