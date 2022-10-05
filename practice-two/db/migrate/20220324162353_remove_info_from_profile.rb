class RemoveInfoFromProfile < ActiveRecord::Migration[7.0]
  def change
    remove_column :profiles, :info, :string
  end
end
