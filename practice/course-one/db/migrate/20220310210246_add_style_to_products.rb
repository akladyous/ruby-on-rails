class AddStyleToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :statys, :boolean, default: false
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email") :products, :style, null: false, foreign_key: true
  end
end
