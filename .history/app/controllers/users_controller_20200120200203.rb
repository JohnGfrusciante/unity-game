class UsersController < ApplicationController
  def index
    # @users = User.find(params[:id])
    @users = User.all
  end
end
