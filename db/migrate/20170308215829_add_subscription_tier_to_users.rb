class AddSubscriptionTierToUsers < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :subscription_tier, :string
  end
end
