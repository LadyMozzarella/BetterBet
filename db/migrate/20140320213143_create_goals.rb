class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :title, null: false
      t.text :description
      t.integer :bet_amount, default: 0
      t.datetime :start_date, null: false
      t.datetime :end_date, null: false
      t.integer :buddy_id
      t.belongs_to :user
    end
    add_index :goals, :user_id
    add_index :goals, :buddy_id
  end
end
