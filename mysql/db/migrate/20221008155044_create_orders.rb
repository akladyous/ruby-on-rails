class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.belongs_to :product, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.boolean :paid
      t.date :purchased_at

      t.timestamps
    end
  end
end
