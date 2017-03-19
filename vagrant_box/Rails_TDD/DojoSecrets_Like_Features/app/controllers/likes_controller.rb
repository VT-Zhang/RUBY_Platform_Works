class LikesController < ApplicationController

  def create
      secret = Secret.find(params[:id])
      Like.create(user: current_user, secret: secret)
      redirect_to "/secrets"
  end

  def destroy
      secret = Secret.find(params[:id])
      Like.find_by(user:current_user, secret: secret).destroy
      redirect_to "/secrets"
  end
end
