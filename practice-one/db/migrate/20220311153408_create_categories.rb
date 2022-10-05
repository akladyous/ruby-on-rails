class CreateCategories < ActiveRecord::Migration[7.0]
    def change
        create_table :categories do |t|
        t.string :name
        t.timestamps
        end
        add_reference :products, :category, index: true
    end
end
