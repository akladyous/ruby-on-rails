class AddIndexesToPerson < ActiveRecord::Migration[7.0]
  def change
    add_index :people, :first_name
    add_index :people, :last_name
  end
end
