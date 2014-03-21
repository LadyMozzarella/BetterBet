class AddColumnsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :token, :string
  	add_column :users, :expires_at, :datetime
  	add_column :users, :uid, :string
  end
end
