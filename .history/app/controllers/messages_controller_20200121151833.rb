class MessagesController < ApplicationController

  def index
    @message = Message.new
    @messages = Message.all
    # message = Message.where(params[:user_id])
    # @user = User.find_by(id: message)
    message = Message.where(params[:user_id])
    @user = User.find_by(id: 3)
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
