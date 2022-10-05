class CreateJoinTableCountryName < ActiveRecord::Migration[7.0]
  def change
    create_join_table :names, :countries do |t|
      t.index [:name_id, :country_id]
       t.index [:country_id, :name_id]
    end
  end
end
