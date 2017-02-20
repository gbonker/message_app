class ConversationsController < ApplicationController
 	before_action :authenticate_user
	
	def index
 		@conversations = Conversation.all
 		@patients = User.where(role: "patient").alphabetical
 		if current_user.role == "patient"
 			@patient_conversation = Conversation.for_patient(current_user)
 		end
 	end

	def create
 		if Conversation.for_patient(params[:patient_id]).present?
    	@conversation = Conversation.for_patient(params[:patient_id]).first
 		else
  		@conversation = Conversation.create!(conversation_params)
 		end

 		redirect_to conversation_messages_path(@conversation)
	end

	private
 	
 	def conversation_params
  	params.require(:conversation)
 	end
end
