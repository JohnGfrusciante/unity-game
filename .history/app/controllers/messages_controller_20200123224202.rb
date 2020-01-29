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

  def edit
    @post_edit = Message.find_by(id: params[:id])
  end

  def show

  end

  def update
    @post_edit = Message.find_by(id: params[:id])
    @post_edit.update(text: params[:text])
    redirect_to root_path
  end

  def destroy
    message = Message.find(params[:id])
    message.destroy
    redirect_to root_path
    # if message.user_id == current_user.id
    #   message.destroy
    # end
  end

  private
  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id)
  end

end
