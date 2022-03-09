class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, prepend: true
  before_action :configure_permitted_parameters, if: :devise_controller?
  add_flash_types :success, :info, :error, :warning

  def force_login_message
    'Please, login to continue!'
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :phone_number, :password, :password_confirmation)}
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :email, :phone_number, :password, :current_password)}
  end
end
