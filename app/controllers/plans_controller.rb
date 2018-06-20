class PlansController < ApplicationController
  def show
  end

  def update
    customer = StripeCustomer.retrieve(current_user)
    subscription = customer.subscriptions.first
    plan = Plan.find(params[:plan][:current_plan_id])
    trial_end = subscription.trial_end
    subscription.plan = plan.stripe_id
    subscription.trial_end =  trial_end if trial_end
    begin
      subscription.save
      current_user.plan = plan
      current_user.save!
      flash[:notice] = "Plan changed successfully"
      redirect_to :plan
    rescue => error
      flash[:error] = error.message
      redirect_to :plan
    end
  end

  def preview_proration
    render json: {'success': "Here is your data"}
  end

  private

  def plan_params
    params.require(:plan).permit(:current_plan_id)
  end
end
