class UserConversationsController < ApplicationController
  before_action :authenticate_user
  before_action :set_conversation

  def create
    @user_conversation = @conversation.user_conversations.where(user_id: current_user.id).first_or_create
    redirect_to conversation_messages_path(@conversation)
  end

  private
    def set_conversation
      @conversation = Conversation.find(params[:conversation_id])
    end
end