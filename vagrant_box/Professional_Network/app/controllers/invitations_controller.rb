class InvitationsController < ApplicationController
    before_action :require_login, except: [:create]

    def create
        Invitation.create(user_id: params[:id], inviter_id: current_user.id)
        redirect_to "/users/showall"
    end

    def destroy
        Invitation.find(params[:id]).destroy
        redirect_to "/professional_profile"
    end
end
