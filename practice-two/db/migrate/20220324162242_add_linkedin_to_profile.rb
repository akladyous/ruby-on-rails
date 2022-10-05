class AddLinkedinToProfile < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :linked, :string
    add_index :profiles, :linked
  end
end
