module ApplicationHelper

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def login!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
    @current_user = user

  end

  def logout
    current_user.reset_session_token!
    session[:session_token] = nil
    @current_user = nil
  end

  def check_log_in
    redirect_to splash_url unless logged_in?
  end


end
