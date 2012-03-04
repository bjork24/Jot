class ApplicationController < ActionController::Base

  protect_from_forgery
  
  helper_method :current_user, :logged_in?, :activated?
  
  protected
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def authenticate
    logged_in? ? true : access_denied("Please log in")
  end
  
  def logged_in?
    current_user.is_a? User
  end
  
  def access_denied(notice)
    redirect_to root_path, :alert => notice and return false
  end
  
end
