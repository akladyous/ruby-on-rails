class CreateUserAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :user_addresses do |t|
      t.string :address
      t.string :address_2
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.references :user_profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
