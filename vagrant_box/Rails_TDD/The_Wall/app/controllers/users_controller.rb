class UsersController < ApplicationController
  def new
  end

  def create
      @user = User.create(username: params[:username])
      if @user.valid?
          redirect_to "/messages"
      else
          flash[:errors] = @user.errors.full_messages
          redirect_to "/users/new"
      end
  end
end
