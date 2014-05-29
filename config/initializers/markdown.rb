def initialize_markdown
  renderer = Redcarpet::Render::HTML.new(render_options = {})
	Redcarpet::Markdown.new(renderer)
end

def configure_markitup
  Markitup::Rails.configure do |config|
    config.formatter = -> markup { $markdown.render(markup) }
  end
end

$markdown = initialize_markdown
configure_markitup
