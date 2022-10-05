class AddSectionToCategories < ActiveRecord::Migration[7.0]
  def change
    add_reference :categories, :section, index: true, foreign_key: true
  end
end
