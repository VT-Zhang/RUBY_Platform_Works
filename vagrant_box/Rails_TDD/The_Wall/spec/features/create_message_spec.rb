require 'rails_helper'
feature "Create a new message" do
    before(:each) do
        visit new_message_path
    end
    scenario "Message created successfully" do
        fill_in "message_message", with: "I am Micheal Jordan."
        fill_in "message_user", with: User.first
        click_button "Post a Message"
        expect(page).to have_current_path(message_path(Message.last))
        expect(page).to have_content "I am Micheal Jordan."
    end
    scenario "Message created unsuccessfully" do
        click_button "Post a Message"
        expect(page).to have_current_path(message_path(Message.last))
        expect(page).to have_content "Message can't be blank"
    end
end
