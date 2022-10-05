class RemoveNichNameIndexFromNames < ActiveRecord::Migration[7.0]
  def change
    # remove_index :names, column: [:nick_name, :first_name, :prova]
    remove_index :names, name: "index_names_on_first_name"
  end
end
