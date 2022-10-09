class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :street
      t.string :city
      t.string :zip
      t.string :state

      t.timestamps
    end
  end
end
