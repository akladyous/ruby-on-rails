class AddRefNumberToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :ref_num, :string
    add_index :products, :ref_num
  end
end
