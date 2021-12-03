class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    unless current_user.first_name.blank? && current_user.last_name.blank?
      flash.notice = "Hello, #{current_user.first_name} #{current_user.last_name}!"
    end
    current_user.is_a?(Admin) ? admin_tests_path : stored_location_for(resource)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name])
  end
end
