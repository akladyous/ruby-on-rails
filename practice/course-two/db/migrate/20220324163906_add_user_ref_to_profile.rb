class AddUserRefToProfile < ActiveRecord::Migration[7.0]
    def up
        add_reference :profiles, :user, null: false, foreign_key: true
    end
    
    # def down 
    #     raise ActiveRecord::IrreversibleMigration
    # end
end
