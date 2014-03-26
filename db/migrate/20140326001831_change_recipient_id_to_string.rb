class ChangeRecipientIdToString < ActiveRecord::Migration
  def change
    change_column :users, :recipient_id, :string
  end
end
