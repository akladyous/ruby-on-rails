class AddContatoreToNames < ActiveRecord::Migration[7.0]
  def change
    add_column :names, :contatore, :decimal, precision: 5, scale: 2
  end
end
