Rails.configuration.stripe = {
  :publishable_key => ENV.fetch('STRIPE_PUBLISHABLE_KEY'),
  :secret_key      => ENV.fetch('STRIPE_SECRET_KEY')
}
Stripe.api_key = ENV.fetch('STRIPE_SECRET_KEY')
Stripe.api_version = "2017-06-05"
