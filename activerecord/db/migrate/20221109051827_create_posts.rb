class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.datetime :published
      t.integer :view_count, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
