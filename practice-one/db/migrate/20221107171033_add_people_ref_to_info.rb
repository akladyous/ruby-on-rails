class AddPeopleRefToInfo < ActiveRecord::Migration[7.0]
  def change
    add_reference :infos, :people, null: false, foreign_key: true
  end
end
