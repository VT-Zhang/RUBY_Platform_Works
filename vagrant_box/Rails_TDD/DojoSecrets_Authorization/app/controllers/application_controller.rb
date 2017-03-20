class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
      User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
      if session[:user_id] == nil
          flash[:errors] = ["You have not logged in yet. Please log in."]
          redirect_to "/sessions/new"
      end
  end

  helper_method :current_user
end
