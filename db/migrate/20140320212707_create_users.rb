class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name, null: false
      t.string :email, null: false, unique: true
      t.string :image
      t.string :token
      t.text :bio
      t.string :password_digest
      t.datetime :expires_at

      t.timestamps
    end
  end
end
