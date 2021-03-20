class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
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
end
