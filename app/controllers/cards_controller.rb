class CardsController < ApplicationController
	before_action :authenticate_user!
  def new
  end

  def create
    @customer = StripeCustomer.retrieve(current_user.stripe_customer_id)
    @source = @customer.sources.create({:source => params[:stripeSource]})
    @customer.default_source = @source.id
    @customer.save
    current_user.payment_source = @source.id
    current_user.is_active = true
    current_user.save!
    if current_user.subscription_id == nil
      StripeSubscription.create(current_user)
    end
    respond_to do |format|
      format.html { redirect_to my_account_path, notice: 'Card was added successfully added' }
    end
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_card_path
  end
end
