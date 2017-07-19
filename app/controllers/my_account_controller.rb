class MyAccountController < ApplicationController
  def show
    @customer = StripeCustomer.retrieve(current_user.stripe_customer_id)
    @card = Stripe::Source.retrieve(@customer.default_source).card unless current_user.payment_source.nil?
  end
end
