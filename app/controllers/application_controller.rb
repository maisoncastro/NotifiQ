class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  devise_group :user, contains: %i[customer business_user]
end
