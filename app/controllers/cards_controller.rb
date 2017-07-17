class CardsController < ApplicationController
	before_action :authenticate_user!
  def new
  end

  def create
    @customer = StripeCustomer.retrieve(current_user.stripe_customer_id)
    @source = @customer.sources.create({:source => params[:stripeSource]})
    @customer.default_source = @source.id
    @customer.save

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_card_path
  end
end
