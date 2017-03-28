class NetworksController < ApplicationController
  before_action :require_login, except: [:create]

  def create
      Network.create(user_id: current_user.id, friend_id: params[:id])
      Invitation.find(params[:idd]).destroy
      redirect_to "/professional_profile"
  end

  def destroy
      Network.find(params[:id]).destroy
      redirect_to "/professional_profile"
  end
end
