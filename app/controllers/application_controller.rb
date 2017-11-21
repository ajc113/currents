class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?
  
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
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :home_port, :state_waters, :vessel_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :home_port, :state_waters, :vessel_name])
  end

  helper_method :current_user

  helper_method :current_admin_user

  private
  
  
end




