class UsersController < ApplicationController
    before_action :require_login, except: [:create]

    def index
        @networks = Network.where(user_id: current_user.id)
        @invitations = Invitation.where(user_id: current_user.id)
        render "/users/index.html.erb"
    end

    def create
        user = User.new(name: params[:name], email: params[:email], description: params[:description], password: params[:password], password_confirmation: params[:password_confirmation])
        if user.valid?
            user.save
            flash[:notices] = ["Congrats, you have successfully registered, now you can log in!"]
            redirect_to "/"
        else
            flash[:errors] = user.errors.full_messages
            redirect_to "/"
        end
    end

  def show
      @user = User.find(params[:id])
      render "/users/show.html.erb"
  end

  def showall
      @users = User.all
      @network = Network.find_by(user: current_user)
      @invitation = Invitation.find_by(user: current_user)
      render "/users/showall.html.erb"
  end
end
