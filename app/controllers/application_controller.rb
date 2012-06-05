class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  #user_signed_in?
  #current_user
  #user_session

#def admins_only  
#  CASClient::Frameworks::Rails::Filter
# end
end
