class CreateMailingLists < ActiveRecord::Migration[7.0]
  def change
    create_table :mailing_lists do |t|
      t.text :message
      t.boolean :subscribe

      t.timestamps
    end
  end
end
