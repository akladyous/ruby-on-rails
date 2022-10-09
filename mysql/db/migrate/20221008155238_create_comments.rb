class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.text :content
      t.belongs_to :photo, null: false, foreign_key: true

      t.timestamps
    end
  end
end
