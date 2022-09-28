class AddSupervisorIdToEmployees < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :supervisor_id, :integer
    add_index :employees, :supervisor_id
  end
end
