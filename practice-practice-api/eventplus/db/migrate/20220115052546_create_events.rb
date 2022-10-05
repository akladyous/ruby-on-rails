class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :organizer
      t.string :location
      t.datetime :start_date
      t.datetime :end_date
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :display_start_time
      t.boolean :display_end_time
      t.string :time_zone
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
