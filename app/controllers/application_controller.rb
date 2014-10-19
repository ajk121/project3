class ApplicationController < ActionController::Base
  protect_from_forgery

  include PublicActivity::StoreController
  
  hide_action :current_user

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: "- I'm Sorry You Cannot Access This Page - Please wait until your account has been verified"
  end

  #{session[:user_id]} 
end
