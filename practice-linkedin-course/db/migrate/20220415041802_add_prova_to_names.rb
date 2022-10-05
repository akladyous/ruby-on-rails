class AddProvaToNames < ActiveRecord::Migration[7.0]
  def change
    add_column :names, :prova, :text, limit: 10
    add_index :names, :prova, unique: true
  end
end
