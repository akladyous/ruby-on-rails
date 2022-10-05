class AddNickNameToNames < ActiveRecord::Migration[7.0]
  def change
    add_column :names, :nick_name, :string
    add_index :names, :nick_name
  end
end
