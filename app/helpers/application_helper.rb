module ApplicationHelper
  def bootstrap_class_for flash_type
    { success: 'alert-success', error: 'alert-danger', notice: 'alert-warning'}[flash_type.to_sym]
  end

  def flash_messages(opts = {})
    flash.map do |msg_type, message|
      content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do
        content_tag(:button, 'x'.html_safe, class: 'close', data: {dismiss: 'alert'}) + message
      end
    end.join.html_safe
  end

  def li_link_to(title, path, options = {})
    options[:class] ||= ''
    options[:class] << ' nav-link'
    options[:class] << ' active' if current_page?(path)
    content_tag(:li, class: 'nav-item') do
      link_to title, path, options
    end
  end


  def alert_message(msg_type, message)
    content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do
      content_tag(:button, 'x'.html_safe, class: 'close', data: {dismiss: 'alert'}) + message
    end
  end

  def markdown(text)
    Kramdown::Document.new(text).to_html.html_safe
  end
end
