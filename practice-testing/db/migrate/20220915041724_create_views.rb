class CreateViews < ActiveRecord::Migration[7.0]
  def change
    create_table :views do |t|
      t.references :viewable, polymorphic: true, null: false
      t.integer :count, default: 0

      t.timestamps
    end
  end
end
