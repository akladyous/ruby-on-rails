class AddStatusToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :status, :integer, limit: 2
  end
end
