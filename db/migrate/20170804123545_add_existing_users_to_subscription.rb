class AddExistingUsersToSubscription < ActiveRecord::Migration[4.2]
	def change
		User.find_each do |user|
			if user.stripe_customer_id == "" then
				StripeCustomer.create(user)
				StripeSubscription.create(user, (Date.today + 31).to_time.to_i )
			end
		end
	end
end
