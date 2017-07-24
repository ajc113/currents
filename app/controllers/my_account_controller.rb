class MyAccountController < ApplicationController
  def show
    @customer = StripeCustomer.retrieve(current_user.stripe_customer_id)
    @subscription = StripeSubscription.retrieve(current_user.subscription_id) unless current_user.subscription_id.nil?
    @card = Stripe::Source.retrieve(@customer.default_source).card unless current_user.payment_source.nil?
    @upcoming_invoice = begin 
                          Stripe::Invoice.upcoming(customer: @customer.id) || nil
                        rescue
                          nil
                        end
    @invoices = @customer.invoices
  end

  private 
  
  def trial_ended?
    DateTime.now.to_i > @subscription.trial_end ? true : false
  end
end
