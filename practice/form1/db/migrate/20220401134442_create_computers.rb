class CreateComputers < ActiveRecord::Migration[7.0]
  def change
    create_table :computers do |t|
      t.string :cpu
      t.integer :ram
      t.integer :hdd
      t.boolean :cdrom

      t.timestamps
    end
  end
end
