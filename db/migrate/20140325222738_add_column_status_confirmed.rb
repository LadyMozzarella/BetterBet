class AddColumnStatusConfirmed < ActiveRecord::Migration
  def change
    add_column :goals, :status_confirmed, :boolean, default: false
  end
end
