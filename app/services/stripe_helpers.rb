module StripeHelpers
  def customer
    @event.data.object.customer
  end

  def find_user_from_event(customer_id)
    @user ||= User.find_by(stripe_customer_id: customer_id)
  end

  attr_reader :event, :user
end
