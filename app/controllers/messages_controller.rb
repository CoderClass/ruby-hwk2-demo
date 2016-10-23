class MessagesController < ApplicationController
  before_action :require_user!

  def incoming
    @incoming_messages = current_user.incoming_messages
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new message_params
    @message.sender = current_user
    if @message.save
      flash[:success] = "Sent a message to #{@message.recipient}"
      redirect_to incoming_messages_path
    else
      render 'new'
    end
  end

  def sent
    @sent_messages = current_user.sent_messages
  end

  def show
    @message = Message.find params[:id]
    if @message.unread?
      @message.mark_as_read!
    else
      redirect_to :back, flash: {error: "Nope! Message has already been read."}
    end
  end

  private
  def message_params
    params.require(:message).permit(:subject, :body, :recipient_id)
  end
end
