class MessagesController < ApplicationController
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    @messages = @conversation.messages
    if @messages.length > 10
      @over_ten = true
      @messages = @messages[-10..-1]
    end
    if params[:m]
      @over_ten = false
      @messages = @conversation.messages
    end
    if @messages.unread.count > 0
      if current_user.role == "patient"
        @messages.unread.each do |message|
          if message.user_id != current_user.id
            message.read = true
            message.save
          end
        end
      else # care manager
        @messages.unread.each do |message|
          if message.user_id != current_user.id
            if message.user.role == "patient"
              message.read = true
              message.save
            end
          end
        end
      end  
      #@messages.unread.each do |message|
      #  if message.user_id != current_user.id
      #    message.read = true
      #    message.save
      #  end
      #end
    end
    @message = @conversation.messages.new
  end

  def new
    @message = @conversation.messages.new
  end
  
  def create
    @message = @conversation.messages.new(message_params)
    @message.user = current_user
    if @message.save
      redirect_to conversation_messages_path(@conversation)
    end
  end

  private
  
  def message_params
    params.require(:message).permit(:body, :user_id)
  end
end