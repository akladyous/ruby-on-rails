class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.integer :age
      t.decimal :weight, precision: 5, scale: 3
      t.text :bio
      t.boolean :married, default: false
      t.date :birthdate

      t.timestamps
    end
  end
end
