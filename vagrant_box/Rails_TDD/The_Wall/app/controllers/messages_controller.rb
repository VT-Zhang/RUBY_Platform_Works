class MessagesController < ApplicationController
  def new
  end

  def dashboard
      @messages = Message.all
  end

  def post_message
      id = session[:c_user][0]['id']
      poster = User.find(id)
      new_message = Message.create(message: params[:message], user:poster)
      if new_message.invalid?
          flash[:errors] = new_message.errors.full_messages
      end
      redirect_to '/dashboard'
  end
end
