class AddEmailToUser < ActiveRecord::Migration[7.0]
    def change
        reversible do |dir|
            dir.up do
                add_column :users, :email, :text
            end
            dir.down do
                remove_column :users, :email, :text
            end
        end
    end
end
