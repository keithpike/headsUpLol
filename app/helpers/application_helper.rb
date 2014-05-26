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
    user.selected_blog
  end

  def logout
    current_user.reset_session_token!
    session[:session_token] = nil
    @current_user = nil
  end

  def check_log_in
    redirect_to splash_url unless logged_in?
  end

  def get_embed_link(passed_url)
    begin
      o = OhEmbedr::OhEmbedr.new(:url => passed_url, :maxwidth => 400)
      embed_data = o.gets
    rescue OhEmbedr::UnsupportedError => error
      o = OhEmbedr::OhEmbedr.new(:url => 'http://www.youtube.com/watch?v=nu8-7huFyvo', :maxwidth => 400)
      embed_data = o.gets
    end
  end


end
