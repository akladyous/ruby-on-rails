class AddFullNameToNames < ActiveRecord::Migration[7.0]
  def change
    add_column :names, :full_name, :string, limit: 50
  end
end
