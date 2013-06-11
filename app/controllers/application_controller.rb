class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :logged_in?

  def require_login
    unless logged_in?
      redirect_to login_url
    end
  end

  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def logged_in?
    !!current_user
  end
end
