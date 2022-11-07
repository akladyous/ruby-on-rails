class AddIndexesToPerson < ActiveRecord::Migration[7.0]
  def up
    add_index :people, :first_name
    add_index :people, :last_name
  end
  def down
    remove_index :people, :first_name
    remove_index :people, :last_name
  end
end
