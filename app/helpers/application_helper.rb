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
    redirect_to root_url unless logged_in?
  end

  def get_embed_link(passed_url)
    obj = $embedly_api.oembed(url: passed_url, maxwidth: 500)
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

  def ensure_logged_out
    redirect_to dashboard_url if logged_in?
  end

  def get_splash_image
    "https://s3-us-west-1.amazonaws.com/headsuplolimages/splash#{("1".."10").to_a.sample}.jpg"
  end

  def get_background_image(thumbnail_url)
    num = thumbnail_url[-5]
    num = "10" if num == "0"
    test = "https://s3-us-west-1.amazonaws.com/headsuplolimages/background_#{num}_#{(1..2).to_a.sample}.jpg"
    test
  end

end
