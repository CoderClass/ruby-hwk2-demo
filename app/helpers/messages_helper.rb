module MessagesHelper
  def message_class(message)
    if message.read?
      ''
    else
      'table-success'
    end
  end
end
