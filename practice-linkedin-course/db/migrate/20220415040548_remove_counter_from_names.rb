class RemoveCounterFromNames < ActiveRecord::Migration[7.0]
  def change
    remove_column :names, :counter, :decimal
  end
end
