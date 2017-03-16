require 'rails_helper'
feature "Register a new user" do
    before(:each) do
        visit new_user_path
    end
    scenario "User created succcefully" do
        fill_in "user_username", with: "Jordan"
        click_button "Sign In"
        expect(page).to have_current_path("/messages")
        expect(page).to have_content "Welcome, Jordan"
    end
    scenario "User created unsuccessfully" do
        click_button "Sign In"
        expect(current_path).to eq("/users/new")
        expect(page).to have_content "Username can't be blank"
    end
end
