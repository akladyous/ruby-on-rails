class CreateListingLosts < ActiveRecord::Migration[7.0]
  def change
    create_table :listing_losts, id: false do |t|
      t.references :listing, null: false, foreign_key: true
      t.references :lost, null: false, foreign_key: true
    end
  end
end
