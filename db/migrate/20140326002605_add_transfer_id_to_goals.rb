class AddTransferIdToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :transfer_id, :string
  end
end
