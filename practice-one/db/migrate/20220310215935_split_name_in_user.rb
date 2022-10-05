class SplitNameInUser < ActiveRecord::Migration[7.0]
    def change
        add_column :users, :first_name, :string
        add_column :users, :last_name, :string

        reversible do |dir|
            User.all.each do |user|
                dir.up   { user.first_name, user.last_name  = user.full_name.split(' ') }
                dir.down { user.full_name = "#{user.first_name} #{user.last_name}" }
                user.save
            end
        end

        revert { add_column :users, :full_name, :string }
    end
end
