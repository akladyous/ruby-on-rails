require_relative '20220312005708_add_status_to_categories'

class RevertAddStatus < ActiveRecord::Migration[7.0]
  def change
    revert AddStatusToCategories
  end
end
