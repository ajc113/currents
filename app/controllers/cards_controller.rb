class CardsController < ApplicationController
	before_action :authenticate_user!
  def new
    @customer = StripeCustomer.retrieve(current_user.stripe_customer_id)
    @card = Stripe::Source.retrieve(@customer.default_source).card unless current_user.payment_source.nil?
    @subscription = StripeSubscription.retrieve(current_user.subscription_id) unless current_user.subscription_id.nil?
  end

  def create
    begin
      @customer = StripeCustomer.retrieve(current_user.stripe_customer_id)
      @source = @customer.sources.create({:source => params[:stripeSource]})
      @customer.default_source = @source.id
      @customer.save
      current_user.payment_source = @source.id
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
    current_user.is_active = true
    current_user.save!
  end
end
