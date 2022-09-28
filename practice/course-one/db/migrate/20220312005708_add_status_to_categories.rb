class AddStatusToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :status, :boolean, default: false, null: false, :comment => "added status to categories"
  end
end
