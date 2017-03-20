class SessionsController < ApplicationController
    before_action :require_login, except: [:create, :new]

    def new
    end

    def create
        if @user = User.find_by(email: params[:email])
            if  User.find_by(email: params[:email]).try(:authenticate, params[:password]) == false
                flash[:m] = "Invalid combination"
                redirect_to "/sessions/new"
            else
                session[:user_id] = @user.id
                session[:name] = @user.name
                session[:email] = @user.email
                redirect_to "/users"
            end
        else
            flash[:errors] = ["User does not exist, please register."]
            redirect_to "/users/new"
        end
    end

    def destroy
        reset_session
        redirect_to "/sessions/new"
    end
end
