class AddGustoToUser < ActiveRecord::Migration[7.0]
    def change
        reversible do |dir|
            dir.up {add_column :users, :gusto, :string, :default => nil, :unique =>  false}
            dir.down {remove_column :users, :gusto, if_exists: true}
        end
        
        
    end
end
