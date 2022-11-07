class RemoveProvaFromProduct < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :prova, :boolean
  end
end
