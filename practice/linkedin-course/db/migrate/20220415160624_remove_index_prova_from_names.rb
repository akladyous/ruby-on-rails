class RemoveIndexProvaFromNames < ActiveRecord::Migration[7.0]
  def change
    remove_index :names, name: "index_names_on_prova"
  end
end
