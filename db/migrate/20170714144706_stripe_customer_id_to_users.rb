class StripeCustomerIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :stripe_customer_id, :string, default: "", null: false
  end
  User.find_each do |user|
    if user.stripe_customer_id == "" then
      StripeCustomer.create(user)
      StripeSubscription.create(user, (Date.today + 31).to_time.to_i )
    end
  end
end
