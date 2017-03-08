class AddSubscriptionTierToUsers < ActiveRecord::Migration
  def change
    add_column :users, :subscription_tier, :string
  end
end
