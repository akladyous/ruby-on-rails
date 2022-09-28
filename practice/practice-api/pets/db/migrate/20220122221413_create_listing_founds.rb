class CreateListingFounds < ActiveRecord::Migration[7.0]
  def change
    create_table :listing_founds, id: false do |t|
      t.references :listing, null: false, foreign_key: true
      t.references :found, null: false, foreign_key: true
    end
  end
end
