class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_raven_context


  def authorize_user!
    authenticate_user!
    unless current_user.is_active?
      requested_path = request.fullpath
      case requested_path
      when "/reports"
        flash[:warning] = "You must have active subscription to see the <b>Live Fishing Reoports</b> of other users"
      when "/maps"
        flash[:warning] = "You must have active subscription to use this feature"
      end
      redirect_to new_card_path
    end
  end
  protected

  def configure_permitted_parameters
    added_attrs = [:first_name, :last_name, :home_port, :state_waters, :vessel_name, :payment_source, :plan_id]
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :home_port, :state_waters, :vessel_name])
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  end

  helper_method :current_user

  helper_method :current_admin_user


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :home_port, :state_waters, :vessel_name, :cardholder_name, :cardholder_phone, :postal_code, :payment_source)
  end

  def set_raven_context
    Raven.user_context(id: session[:current_user_id]) # or anything else in session
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end
end
