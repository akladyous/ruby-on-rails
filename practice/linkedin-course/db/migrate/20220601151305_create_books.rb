class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :pages
      t.string :author
      t.string :category
      t.decimal :price, precision: 5, scale: 2

      t.timestamps
    end
  end
end
