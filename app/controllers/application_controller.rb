class ApplicationController < ActionController::Base
  protect_from_forgery

  include PublicActivity::StoreController
  
  hide_action :current_user

  rescue_from CanCan::AccessDenied do |exception|
  puts case 
  when current_user.role == "approved"
    redirect_to root_path, alert: "I'm Sorry You Cannot Access This Page"
  when current_user.role == "pending"
    redirect_to root_path, alert: "Your registration is being checked - We won't be long!"
  when current_user.role == "declined"
    redirect_to root_path, alert: "We are very sorry your account has been declined - Please speak to your mentor and ask them to contact us"
  else 
    redirect_to root_path, alert: "- I'm Sorry You Cannot Access This Page - Please wait until your account has been verified"
  end

end 
  #{session[:user_id]} 
end
