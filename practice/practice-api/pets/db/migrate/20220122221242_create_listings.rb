class CreateListings < ActiveRecord::Migration[7.0]
  def change
    create_table :listings do |t|
      t.boolean :published
      t.datetime :published_at
      t.references :user, null: false, foreign_key: true
      t.references :pet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
