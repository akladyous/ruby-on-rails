class AddQtySoldToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :qty_sold, :integer
  end
end
