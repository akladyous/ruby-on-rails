class CreateLosts < ActiveRecord::Migration[7.0]
  def change
    create_table :losts do |t|
      t.datetime :date
      t.text :description
      t.string :url

      t.timestamps
    end
  end
end
