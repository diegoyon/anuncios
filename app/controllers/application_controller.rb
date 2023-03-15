class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: [:home]

  protected

  def after_sign_in_path_for(*)
    announcements_path
  end

  # def after_sign_up_path_for(*)
  #   announcements_path
  # end

  def configure_permitted_parameters
    # devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :last_name, :email, :password)}
    # devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :last_name, :email, :password, :current_password)}
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :last_name])
  end
end
