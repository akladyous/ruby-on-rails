class CreateMailingLists < ActiveRecord::Migration[7.0]
  def change
    create_table :mailing_lists do |t|
      t.string :name
      t.string :group

      t.timestamps
    end
  end
end
