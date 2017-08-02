# Preview all emails at http://localhost:3000/rails/mailers/subscription_mailer
class SubscriptionMailerPreview < ActionMailer::Preview
  SubscriptionMailer.instance_methods(false).each do |method|
    define_method method do
      SubscriptionMailer.public_send(method, User.first)
    end
  end
end
