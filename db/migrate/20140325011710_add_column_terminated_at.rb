class AddColumnTerminatedAt < ActiveRecord::Migration
  def change
    add_column :goals, :terminated_at, :datetime
  end
end
