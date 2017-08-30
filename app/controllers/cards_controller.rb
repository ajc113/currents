class CardsController < ApplicationController
	before_action :authenticate_user!
  def new
    @customer = StripeCustomer.retrieve(current_user)
    @card ||= begin
                Stripe::Source.retrieve(@customer.default_source).card unless current_user.payment_source.nil?
              rescue => error
                GithubIssues.create(error, self, __method__, current_user) 
              end
    @subscription = StripeSubscription.retrieve(current_user) unless current_user.subscription_id.nil?
  end

  def create
    begin
      @customer = StripeCustomer.retrieve(current_user)
      @source = @customer.sources.create({:source => params[:stripeSource]})
      @customer.default_source = @source.id
      @customer.save
      current_user.payment_source = @source.id
      current_user.save!
      if current_user.subscription_id == nil
        StripeSubscription.create(current_user)
      end
      respond_to do |format|
        format.html { redirect_to my_account_path, notice: notice }
      end
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_card_path
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
