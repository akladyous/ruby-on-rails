class CreateFriendships < ActiveRecord::Migration[7.0]
  def change
    create_table :friendships do |t|
      t.integer :follower_id
      t.integer :followed_id
      t.integer :status, default: 0, limit: 1

      t.timestamps
    end
    add_index :friendships, :follower_id
    add_index :friendships, :followed_id
  end
end
