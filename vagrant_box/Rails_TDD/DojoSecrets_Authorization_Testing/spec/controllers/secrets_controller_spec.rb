require 'rails_helper'
RSpec.describe SecretsController, type: :controller do
  before do
    @user = create(:user)
    @secret = create(:secret, user: @user)
  end
  context "when not logged in" do
    before do
      session[:user_id] = nil
    end
    it "cannot access index" do
        get :index
        expect(response).to redirect_to("/sessions/new")
    end
    it "cannot access create" do
        get :create
        expect(response).to redirect_to("/sessions/new")
    end
    it "cannot access destroy" do
        get :destroy, id: @secret
        expect(response).to redirect_to("/sessions/new")
    end
  end
  
  context "when signed in as the wrong user" do
    it "cannot destroy another user's secret" do
        @user2 = User.create(name:"Mike", email:"mike@email.com", password:"password", password_confirmation:"password")
        get :destroy, id: @user2.id
        expect(response).to redirect_to("/users/#{@user.id}")
    end

  end
end
