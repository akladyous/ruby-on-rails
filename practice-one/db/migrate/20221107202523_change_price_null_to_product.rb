class ChangePriceNullToProduct < ActiveRecord::Migration[7.0]
  def change
    change_column_null :products, :price, false
  end
end
