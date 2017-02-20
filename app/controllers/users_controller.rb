class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
	  @user = User.new(user_params)
	  if @user.save
	  	session[:user_id] = @user.id
      if @user.role == "patient"
        conversation = Conversation.create!
        UserConversation.create(user_id: @user.id, conversation_id: conversation.id)
      end
	    redirect_to home_path, :notice => "Signed up!"
	  else
	    render "new"
	  end
	end

	private

	def user_params
    params.require(:user).permit(:first_name, :last_name, :role, :email, :password, :password_confirmation)
  end
end
