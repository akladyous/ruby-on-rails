class RenameContatoreToCounterInNames < ActiveRecord::Migration[7.0]
  def change
    rename_column :names, :contatore, :counter
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
