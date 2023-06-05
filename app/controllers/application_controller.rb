class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:full_name, :phone, :password) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:full_name, :phone, :email, :password, :current_password)
    end
  end

  def after_sign_in_path_for(resource)
    case resource
    when Doctor
      doctor_session_path
    when User
      user_session_path
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end
end
