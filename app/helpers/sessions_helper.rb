module SessionsHelper
  
  def sign_in(user)
    session[:user_id] = user
    current_user = user
  end
  
  def signed_in?
    !current_user.nil?
  end
  
  def current_user=(user)
    @current_user = user
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def sign_out
    session[:user_id] = nil
    current_user = nil
  end
end
