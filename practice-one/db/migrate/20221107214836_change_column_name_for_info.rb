class ChangeColumnNameForInfo < ActiveRecord::Migration[7.0]
  def change
    rename_column :infos, :info, :name
  end
end
