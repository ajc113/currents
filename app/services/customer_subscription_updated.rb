class CustomerSubscriptionUpdated
  def call(event)
    @event = event
    puts (@event.type).colorize(:yellow)
    user = User.find_by_stripe_customer_id(event.data.object.customer)
    if event.data.object[:status] == "active" && event.data.previous_attributes[:status].present?
      if event.data.previous_attributes[:status] == "trialing"
        if user.payment_source == nil
          user.is_active = false
          user.save!
          SubscriptionMailer.delay.customer_subscription_updated(user)
        else
          SubscriptionMailer.delay.trial_over(user)
        end
      end
    elsif event.data.previous_attributes[:trial_end].present?
      user.is_active = true
      user.save!
      trial_end_date = Date.strptime(event.data.object.trial_end.to_s, '%s')
      SubscriptionMailer.delay.trial_extended(user, trial_end_date)
    end
  end
end
