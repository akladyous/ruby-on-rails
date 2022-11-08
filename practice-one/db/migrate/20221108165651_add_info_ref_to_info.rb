class AddInfoRefToInfo < ActiveRecord::Migration[7.0]
  def change
    add_reference :infos, :user, foreign_key: true
  end
end
