class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :name, unique: true
      t.date :founded_on

      t.timestamps
    end
  end
end
