class MessagesController < ApplicationController

  def index
    @message = Message.new
    @messages = Message.all.order("created_at DESC")
  end

  def new
    
  end

  def create
    # Message.create(message_params)
    @post = Message.create(message_params)
    respond_to do |format|
      format.html { redirect_to root_path  }
      format.json
    end
  end

  def show

  end

  def edit

  end

  private
  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id)
  end

end
