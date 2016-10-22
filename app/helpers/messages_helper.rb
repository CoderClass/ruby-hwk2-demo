module MessagesHelper
  def message_class(message)
    if message.read?
      ''
    else
      'table-success'
    end
  end

  def list_item_li_to(path, options = {}, &block)
    options[:class] ||= ''
    options[:class] << ' list-group-item'
    options[:class] << ' active' if current_page?(path)
    link_to path, options do
      yield
    end
  end
end
