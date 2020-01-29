class MessagesController < ApplicationController

  def index
    @message = Message.new
    @messages = Message.all.order("created_at DESC")
    message = Message.where(params[:user_id])
    @user = User.where(id: message)
    binding.pry
  end

  def new
    
  end

  def create
    Message.create(message_params)
  end

  def show

  end

  private
  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id)
  end

end
