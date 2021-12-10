class ApplicationController < ActionController::Base
  #CHRRLLL
  helper_method :current_user, :logged_in?

  def current_user 
    @current_user = User.find_by(session_token: session[:session_token])
  end

  def require_logged_in #assuming you're logged out 
    redirect_to new_session_url unless logged_in?
  end

  def require_logged_out 
    redirect to users_url if logged_in?
  end

  def logged_in? 
    !!current_user  #!current_user.nil?
  end

  def login!(user)
    session[:session_token] = user.reset_session_token!
  end

  def logout
    current_user.reset_session_token!
    session[:session_token] = nil 
    @current_user = nil
  end


end
