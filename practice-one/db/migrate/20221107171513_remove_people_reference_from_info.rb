class RemovePeopleReferenceFromInfo < ActiveRecord::Migration[7.0]
  def change
    remove_reference :infos, :people, index: true
  end
end
