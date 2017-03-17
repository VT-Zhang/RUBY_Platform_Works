class SecretsController < ApplicationController
  def index
      @secrets = Secret.all
  end

  def create
      @secret = Secret.new(content: params[:content], user: User.find(session[:user_id]))
      if @secret.valid?
          @secret.save
        #   flash[:errors] = ["You just added a new secret...."]
          redirect_to "/users/"+(session[:user_id]).to_s
      else
          flash[:errors] = @secret.errors.full_messages
          redirect_to "/users/"+(session[:user_id]).to_s
      end
  end

  def destroy
      secret = Secret.find(params[:id])
      secret.destroy
      redirect_to "/users/"+(session[:user_id]).to_s
  end
end
