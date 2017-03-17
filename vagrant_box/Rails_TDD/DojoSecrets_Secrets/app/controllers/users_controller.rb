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

  def edit
  end

  def update
      @user = User.find(session[:user_id])
      @user.name = params[:name]
      @user.email = params[:email]
      @user.password = params[:password]
      @user.password_confirmation = params[:password_confirmation]
      if @user.valid?
          @user.save
          session[:name] = @user.name
          redirect_to "/users"
      else
          flash[:errors] = @user.errors.full_messages
          redirect_to "/users/" + (@user.id).to_s + "/edit"
      end
  end

  def show
  end

  def destroy
      user = User.find(session[:user_id])
      user.destroy
      reset_session
      redirect_to "/users/new"
  end

end
