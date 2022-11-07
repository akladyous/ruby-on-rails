class AddProvaToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :prova, :boolean, default: false
  end
end
