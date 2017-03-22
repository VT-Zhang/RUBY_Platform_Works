class UsersController < ApplicationController

  def new

  end

  def create
      user = User.create(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
      if user.valid?
          user.save
          flash[:notices] = ["You have successfully registered!"]
          redirect_to "/sessions/new"
      else
          flash[:errors] = user.errors.full_messages
          redirect_to "/users/new"
      end
  end

  def show
      @secrets_own = Secret.where(user: current_user)
      @secrets_liked = Like.includes(:secret).where(user: current_user)
    #   @secrets_liked = User.where(secrets_liked: current_user)
  end
end
