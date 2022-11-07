class RemovePeopleRefFromInfo < ActiveRecord::Migration[7.0]
  def change
    remove_reference :infos, :people, foreign_key: true, index: true
  end
end
