class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email
      t.boolean :active, default: true
      t.integer :role, default: 0, limit: 1

      t.timestamps
    end
  end
end
