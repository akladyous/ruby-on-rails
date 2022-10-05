class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.text :full_name
      t.integer :age
      t.boolean :status

      t.timestamps
    end
  end
end
