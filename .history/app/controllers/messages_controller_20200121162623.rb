class MessagesController < ApplicationController

  def index
    @message = Message.new
    @messages = Message.all.order("created_at DESC")
    # message = Message.find_by(params[:user_id])
    @post = Message.find_by(params[:user_id])
    binding.pry
    # @user = User.find_by(message.user_id)
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
