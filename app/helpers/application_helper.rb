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
    obj = embedly_api.oembed(url: passed_url, maxwidth: 500)
    debugger
    sleep 5
  end

  def get_markdown_renderer
    $markdown
  end

  def parse_chat(text)
    parsed_chat = []
    lines = text.split("\r\n")
    lines.each do |line|
      lineFragments = line.split(':')
      lineFragments[0] = "**" + lineFragments.first + "**" unless lineFragments[1].nil?

      if lineFragments[0].nil?
        parsed_chat << "\r\n"
      else
        parsed_chat << lineFragments.join(":")
      end
    end
    parsed_chat.join("\r\n")

  end


end
