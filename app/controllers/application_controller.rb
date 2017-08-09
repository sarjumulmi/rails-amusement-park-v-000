class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session.include?(:user_id)
  end

  def require_log_in
    redirect_to root_path unless logged_in?
  end

  def logged_in?
    !!current_user
  end

  def admin?
    logged_in? && current_user.admin
  end

  helper_method :current_user
  helper_method :admin?

end
