require 'rails_helper'
feature 'authentication' do
    before(:each) do
        @user = User.create(name: "Jason", email: "jason@email.com", password:"password", password_confirmation:"password")
    end

    feature "user sign-in" do
        scenario "visit sign-in page" do
            visit "/sessions/new"
            expect(page).to have_field("email")
            expect(page).to have_field("password")
        end
        scenario "logs in user if email/password combination is valid" do
            visit "/sessions/new"
            fill_in "email", with: "jason@email.com"
            fill_in "password", with: "password"
            click_button "Log In"
            expect(current_path).to eq("/users/#{@user.id}")
            expect(page).to have_text(@user.name)
        end
        scenario "should not sign in user if email is not found" do
            visit "/sessions/new"
            fill_in "email", with: "jason@email.com"
            fill_in "password", with: "notpass"
            click_button "Log In"
            expect(current_path).to eq("/sessions/new")
            expect(page).to have_text("Invalid combination")
        end
    end

    feature "user log out" do
        before do
            visit "/sessions/new"
            fill_in "email", with: "jason@email.com"
            fill_in "password", with: "password"
            click_button "Log In"
        end
        scenario "display 'Log Out' button when user is logged on" do
            expect(page).to have_button("Log Out")
        end
        scenario "logs out user and redirect to login page" do
            click_button "Log Out"
            expect(current_path).to eq("/sessions/new")
        end
    end
end
