class LikesController < ApplicationController
  def create
      Like.create(user_id: current_user.id, secret_id: params[:id])
      redirect_to "/secrets"
  end

  def destroy
      Like.find(params[:id]).destroy
      redirect_to "/secrets"
  end
end
