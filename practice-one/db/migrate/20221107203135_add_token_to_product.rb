class AddTokenToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :token, :string
  end
end
