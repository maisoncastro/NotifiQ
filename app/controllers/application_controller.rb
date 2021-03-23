class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  devise_group :user, contains: %i[customer business_user]

  protected

  def after_sign_in_path_for(resource)
    # return the path based on resource
    if resource.instance_of?(BusinessUser)
      dashboard_index_path
    else
      confirmations_index_path
    end
  end

  def configure_permitted_parameters
    # devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:fname, :lname, :username, :email, :password) }
    # devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:fname, :lname, :username, :email, :password, :current_password) }

    added_attrs = %i[fname lname username email password]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
