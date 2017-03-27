class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_driver
     Driver.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_driver

  def current_rider
     Rider.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_rider

    def require_login
        if session[:user_id] == nil
            flash[:errors] = ["Please log in"]
            redirect_to "/login"
        end
    end
end
