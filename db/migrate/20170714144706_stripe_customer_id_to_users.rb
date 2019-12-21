class StripeCustomerIdToUsers < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :stripe_customer_id, :string, default: "", null: false
  end
end
