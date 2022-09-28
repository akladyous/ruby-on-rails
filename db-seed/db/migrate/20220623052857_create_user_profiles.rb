class CreateUserProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :user_profiles do |t|
      t.string :first_name, limit: 50
      t.string :last_name, limit: 50
      t.string :phone, limit: 10
      t.string :title, limit: 25
      t.string :company, limit: 25
      t.string :website, limit: 100
      t.string :blog, limit: 100
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
