class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(email: params[:email])
        if  User.find_by(email: params[:email]).try(:authenticate, params[:password]) == false
            flash[:m] = "Invalid combination"
            redirect_to "/sessions/new"
        else
            session[:user_id] = user.id
            session[:name] = user.name
            redirect_to "/users/"+(user.id).to_s
        end
    end

    def destroy
        session[:user_id] = null
        session[:name] = null
        redirect_to "/sessions/new"
    end
end
