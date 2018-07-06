StripeEvent.signing_secret = ENV['STRIPE_SIGNING_SECRET'] || 'signing_secret'

StripeEvent.configure do |events|
  events.subscribe 'customer.subscription.created', ::CustomerSubscriptionCreated.new
  events.subscribe 'customer.subscription.trial_will_end', ::CustomerSubscriptionTrialWillEnd.new
  events.subscribe 'customer.subscription.updated', ::CustomerSubscriptionUpdated.new
  events.subscribe 'customer.subscription.deleted', ::CustomerSubscriptionDeleted.new
  events.subscribe 'invoice.upcoming', ::InvoiceUpcoming.new
  events.subscribe 'invoice.updated', ::InvoiceUpdated.new
  events.subscribe 'invoice.payment_failed', ::InvoicePaymentFailed.new
  events.subscribe 'invoice.payment_succeeded', ::InvoicePaymentSucceeded.new
  events.subscribe 'customer.source.created', ::CustomerSourceCreated.new
  events.subscribe 'charge.failed', ::ChargeFailed.new
end
