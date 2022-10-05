class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.belongs_to :company, null: false, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :email, unique: true
      t.boolean :active, default: true
      t.integer :role, default: 0, limit: 2

      t.timestamps
    end
    add_index :users, [:email, :company_id, :username], unique: true
  end
end
