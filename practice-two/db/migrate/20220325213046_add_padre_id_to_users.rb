class AddPadreIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :padre_id, :integer
    add_index :users, :padre_id
  end
end
