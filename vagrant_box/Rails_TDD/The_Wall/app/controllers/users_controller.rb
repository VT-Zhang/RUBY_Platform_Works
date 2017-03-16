class UsersController < ApplicationController
  def new
  end

  def create
      if User.exists?(username: params[:username])
          session[:c_user] = User.find_by(username: params[:username])
          redirect_to "/messages"
      else
          new_user = User.create(username: params[:username])
          if new_user.valid?
              session[:c_user] = [new_user]
              redirect_to "/messages"
          else
              flash[:errors] = new_user.errors.full_messages
              redirect_to "/users/new"
          end
      end
  end

  def log_out
      reset_session
      redirect_to "/users/new"
  end
end
