class CreateUserAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :user_addresses do |t|
      t.string :address, limit: 50
      t.string :city, limit: 30
      t.string :zip_code
      t.string :state, limit: 30
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
