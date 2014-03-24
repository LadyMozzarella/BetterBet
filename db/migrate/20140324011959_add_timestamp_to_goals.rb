class AddTimestampToGoals < ActiveRecord::Migration
  def change
    change_table :goals do |t|
      t.timestamps
    end
  end
end
