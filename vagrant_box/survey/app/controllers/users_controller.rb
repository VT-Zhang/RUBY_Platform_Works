class UsersController < ApplicationController

  def index
      if session[:counter] == nil
         session[:counter] = 0
      end
      render 'users/index.html.erb'
  end

  def create
      if session[:counter].nil?
         session[:counter] = 0
      else
         session[:counter] += 1
      end

      @user = User.create(name: params[:name], location: params[:location], language: params[:language], comment: params[:comment])
      redirect_to '/result'
  end

  def show
      @user = User.last
      flash[:submitCounter] = "You have submitted this form #{session[:counter]} times!!"
      render 'users/create.html.erb'
  end
end
