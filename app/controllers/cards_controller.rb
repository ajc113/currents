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
    begin
      source = params[:stripeSource]
      @customer = StripeCustomer.retrieve(current_user)
      @customer.source = source
      @customer.save
      current_user.payment_source = source
      current_user.save!
    rescue Stripe::CardError => error
      flash[:error] = error.message
      redirect_to new_card_path and return
    end

    if current_user.subscription_id == nil
      begin
        StripeSubscription.create(current_user)
      rescue Stripe::CardError => error
        flash[:error] = "There is some problem with your card. Please consult your bank"
        redirect_to new_card_path and return
      end
    end

    respond_to do |format|
      format.html { redirect_to my_account_path, notice: notice }
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
end
