class RemoveNickNameIndexFromNames < ActiveRecord::Migration[7.0]
  def change
    remove_index :names, name: "index_names_on_nick_name"
  end
end
