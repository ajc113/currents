class StripeCustomerIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :stripe_customer_id, :string, default: "", null: false
  end
  User.find_each do |user|
    if user.stripe_customer_id == "" then
      StripeCustomer.create(user)
    end
  end
end
