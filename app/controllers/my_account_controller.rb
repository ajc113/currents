class MyAccountController < ApplicationController
  before_action :authenticate_user!
  def show
    @customer = StripeCustomer.retrieve(current_user)
    @subscription = StripeSubscription.retrieve(current_user) unless current_user.subscription_id.nil?
    @card = begin Stripe::Source.retrieve(@customer.default_source).card unless current_user.payment_source.nil?
              rescue => error
                GithubIssues.create(error, self, __method__, current_user.inspect)
              end
    @upcoming_invoice = begin 
                          Stripe::Invoice.upcoming(customer: @customer.id)
                        rescue Stripe::InvalidRequestError => error
                          return nil
                        rescue
                          GithubIssues.create(error, self, __method__, current_user.inspect) 
                        end
    @invoices = @customer.invoices
  end

  def destroy
    StripeSubscription.delete(current_user)
    respond_to do |format|
      format.html { redirect_to my_account_url, alert: 'Subscription was cancelled successfully' }
    end
  end

  private 
  
  def trial_ended?
    DateTime.now.to_i > @subscription.trial_end ? true : false
  end
end
