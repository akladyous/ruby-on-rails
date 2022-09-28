class AddActiveToCountry < ActiveRecord::Migration[7.0]
  def change
    add_column :countries, :active, :boolean, default: true
  end
end
