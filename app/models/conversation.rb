class Conversation < ActiveRecord::Base
 	has_many :user_conversations
 	has_many :users, through: :user_conversations
	has_many :messages, dependent: :destroy
	
	#scope :between, -> (sender_id, recipient_id) do
 	#	where("(conversations.sender_id = ? AND conversations.recipient_id =?) OR (conversations.sender_id = ? AND conversations.recipient_id =?)", sender_id,recipient_id, recipient_id, sender_id)
 	#end

 	def self.for_patient(patient)
 		UserConversation.where(user_id: patient.id).map{ |uc| uc.conversation }.first
 	end

end
