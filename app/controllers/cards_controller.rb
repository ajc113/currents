class CardsController < ApplicationController
	before_action :authenticate_user!
  def new
  end

  def create
    @customer = Stripe::Customer.retrieve(current_user.stripe_customer_id)
    @card = @customer.sources.create({:source => params[:stripeSource]})
    puts "params from create"
    puts params

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_card_path
  end
end
