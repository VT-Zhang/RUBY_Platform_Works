class InvitationsController < ApplicationController
    before_action :require_login, except: [:create]

    def create
        Invitation.create(user: current_user, inviter_id: params[:id])
        redirect_to "/users/showall"
    end

    def destroy
        Invitation.find_by(user_id: params[:id]).destroy
        redirect_to "/professional_profile"
    end
end
