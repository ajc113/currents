class AddSubscriptionIdToUsers < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :subscription_id, :string
  end
end
