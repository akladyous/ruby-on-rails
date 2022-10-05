class CreateFounds < ActiveRecord::Migration[7.0]
  def change
    create_table :founds do |t|
      t.datetime :date
      t.text :description
      t.string :url

      t.timestamps
    end
  end
end
