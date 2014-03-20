class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.belongs_to :user
      t.integer :friend_id
    end
    add_index :friendships, :user_id
    add_index :friendships, :friend_id
  end
end
