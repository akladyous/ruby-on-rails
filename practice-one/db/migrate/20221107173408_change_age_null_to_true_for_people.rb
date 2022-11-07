class ChangeAgeNullToTrueForPeople < ActiveRecord::Migration[7.0]
  def change
    change_column_null :people, :age, false
  end
end
