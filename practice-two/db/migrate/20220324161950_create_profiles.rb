class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :website
      t.string :blog
      t.string :info

      t.timestamps
    end
  end
end
