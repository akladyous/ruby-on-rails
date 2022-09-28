class ChangeDefaultValueForProductsCountInCategory < ActiveRecord::Migration[7.0]
  def change
    change_column_default :categories, :products_count, 0
  end
end
