class AddCoursedToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :course, :string
    add_index :users, :course
  end
end
