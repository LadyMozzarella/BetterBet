class ChangeEmailConstraints < ActiveRecord::Migration
  def change
  	change_column :users, :email, :string, null: false, unique: true
  end
end
