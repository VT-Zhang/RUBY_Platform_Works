class SessionsController < ApplicationController
  def new
  end

  def create
      if user = User.find_by(email: params[:email])
          if user.try(:authenticate, params[:password]) == false
              flash[:errors] = ["Invalid Password/Email Combination, please try again.."]
              redirect_to "/sessions/new"
          else
              session[:user_id] = user.id
              redirect_to "/users/#{current_user.id}"
          end
      else
          flash[:errors] = ["User does not exist, please register."]
          redirect_to "/sessions/new"
      end

  end

  def destroy
      reset_session
      redirect_to "/sessions/new"
  end

end
