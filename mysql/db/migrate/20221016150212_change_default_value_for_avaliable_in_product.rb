class ChangeDefaultValueForAvaliableInProduct < ActiveRecord::Migration[7.0]
  def change
    change_column_default :products, :avaliable, false
  end
end
