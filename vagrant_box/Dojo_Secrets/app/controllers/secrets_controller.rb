class SecretsController < ApplicationController
  def index
      @secrets = Secret.all.order(created_at: :desc)
  end

  def create
      secret = Secret.create(secret: params[:secret], user: current_user)
      if secret.valid?
          redirect_to "/users/#{current_user.id}"
      else
          flash[:errors] = secret.errors.full_messages
          redirect_to "/users/#{current_user.id}"
      end
  end

  def destroy
      Secret.find(params[:id]).destroy
      redirect_to(:back)
  end
end
