module ApplicationHelper

  def flash_class(level)
    case level
      when :notice then "info"
      when :success then "success"
      when :error then "error"
      when :alert then "warning"
    end
  end

  def markdown(text)
    options = [:hard_wrap => true, :filter_html => true, :autolink => true, :no_intraemphasis => true, :fenced_code => true, :gh_blockcode => true]
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, *options)
    raw markdown.render(text)
  end
end
