class SessionsController < ApplicationController

  def index
      render "/sessions/index.html.erb"
  end

  def new
      render "/sessions/new.html.erb"
  end

  def create
      if user = Driver.find_by(email: params[:email])
          if user.try(:authenticate, params[:password]) == false
              flash[:errors] = ["Invalid Password/Email Combination, Please try again."]
              redirect_to "/sessions/new"
          else
              session[:user_id] = user.id
              redirect_to "/drivers/#{user.id}"
          end

      elsif user = Rider.find_by(email: params[:email])
          if user.try(:authenticate, params[:password]) == false
              flash[:errors] = ["Invalid Password/Email Combination, Please try again."]
              redirect_to "/sessions/new"
          else
              session[:user_id] = user.id
              redirect_to "/riders/#{user.id}"
          end
      else
          flash[:errors] = ["The user does not exist, please register."]
          redirect_to "/sessions/new"
      end
  end

  def destroy
      reset_session
      flash[:notices]=["Successfully logged out."]
      redirect_to "/sessions/new"
  end
end
