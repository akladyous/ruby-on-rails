class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price, precision: 5, scale: 2
      t.integer :weight
      t.boolean :avaliable
      t.integer :quantity
      t.string  :department
      t.timestamps
    end
  end
end
