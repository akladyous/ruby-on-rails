class AddTokenToInfo < ActiveRecord::Migration[7.0]
  def change
    add_column :infos, :token, :string
  end
end
