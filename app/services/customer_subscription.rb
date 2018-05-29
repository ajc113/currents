class CustomerSubscription
  def initialize(event)
    @event = event
    puts @event.data.object.plan.class
    puts @event.data.object.plan.nickname
    puts "Event customer is: #{@event.data.object.customer}"
  end

  def trial_will_end
  end

  def user
    @user ||= User.find_by_stripe_customer_id(@event.customer)
  end
end
