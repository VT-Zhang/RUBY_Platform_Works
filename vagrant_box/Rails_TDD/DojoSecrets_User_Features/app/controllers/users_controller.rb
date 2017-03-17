class UsersController < ApplicationController
  def new
  end

  def create
      user = User.new(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
      if user.valid?
          user.save
          redirect_to "/sessions/new"
      else
          flash[:errors] = user.errors.full_messages
          redirect_to "/users/new"
      end
  end

  def show
  end

  def edit
  end
end
