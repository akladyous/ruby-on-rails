class ChangeFirstNameInNames < ActiveRecord::Migration[7.0]
  def change
    change_column :names, :first_name, :string, :null => false, :unique => true
    #Ex:- :null => false
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
