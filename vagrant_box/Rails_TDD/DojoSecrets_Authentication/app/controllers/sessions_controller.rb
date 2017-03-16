class SessionsController < ApplicationController
    def new

    end

    def create
        # Log User In
        user = User.find_by(email: params[:Email])
        if user.authenticate(params[:Password]) == true
            session[:user_id] = user.id
            redirect_to "/users/#{user.id}"
        # if authenticate true
            # save user id to session
            # redirect to users profile page
        else
            flash[:errors] = new_message.errors.full_messages
            redirect_to "/sessions/new"
        # if authenticate false
            # add an error message -> flash[:errors] = ["Invalid"]
            # redirect to login page
        end
    end

    def destroy
        session[:user_id] = null
        redirect_to "/sessions/new"
        # Log User out
        # set session[:user_id] to null
        # redirect to login page
    end
end
