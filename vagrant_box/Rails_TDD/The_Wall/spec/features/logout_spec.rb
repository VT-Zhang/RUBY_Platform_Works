require 'rails_helper'
feature "Logout from the session" do
    scenario "User logged out uccessfully" do
        expect(page).to have_content(click_on "Log_Out")
        click_button ("Log_Out")
        expect(current_path).to eq(new_user_path)
    end
end
