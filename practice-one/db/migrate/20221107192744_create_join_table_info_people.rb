class CreateJoinTableInfoPeople < ActiveRecord::Migration[7.0]
  def change
    create_join_table :infos, :people do |t|
      t.index [:info_id, :person_id]
      t.index [:person_id, :info_id]
    end
  end
end
