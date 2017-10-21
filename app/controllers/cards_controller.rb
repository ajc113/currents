class CardsController < ApplicationController
  before_action :authenticate_user!
  def new
    @customer = StripeCustomer.retrieve(current_user)
    @card = begin
              Stripe::Source.retrieve(@customer.default_source).card unless current_user.payment_source.nil?
            rescue => error
              GithubIssues.create(error, self, __method__, current_user) 
            end
    @subscription = StripeSubscription.retrieve(current_user) unless current_user.subscription_id.nil?
  end

  def create
    source = params[:stripeSource]
    StripeCustomer.save_source(current_user, source)
    begin
      create_subscription_if_does_not_exist(current_user)
      Invoice.pay_if_pending(current_user)
    rescue Stripe::CardError => error
      redirect_to :back, flash: { error: error.message } and return
    rescue => error
      flash[:error] = error.message
      redirect_to :back, flash: { error: error.message } and return
    else
      respond_to do |format|
        format.html { redirect_to my_account_path, notice: notice }
      end
    end
  end

  private 

  def notice
    notice = 'Card was successfully updated.'
    if current_user.subscription_id.nil?
      notice += " You are successfully subscribed. Cheers!"
    end
    notice
  end

  def create_subscription_if_does_not_exist(user)
    if user.subscription_id == nil
      StripeSubscription.create(user)
    end
  end
end
