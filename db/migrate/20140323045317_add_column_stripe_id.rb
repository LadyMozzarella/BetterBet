class AddColumnStripeId < ActiveRecord::Migration
  def change
    add_column :users, :stripe_id, :integer
  end
end
