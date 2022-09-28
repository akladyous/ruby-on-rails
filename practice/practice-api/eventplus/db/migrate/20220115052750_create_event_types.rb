class CreateEventTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :event_types do |t|
      t.string :type
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
