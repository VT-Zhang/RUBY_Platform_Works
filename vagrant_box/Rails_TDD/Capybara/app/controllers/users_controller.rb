class UsersController < ApplicationController
  def new
  end

  def create
      @user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email])
      if @user.save
          flash[:notice] = ["User successfully created."]
          redirect_to user_path(User.last)
      else
          flash[:notice] = @user.errors.full_messages
          redirect_to new_user_path
      end

  def show
     @user = User.last
  end
  end
end
