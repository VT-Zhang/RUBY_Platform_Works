require "rails_helper"
feature "User features" do
    before do
        @user = create(:user)
        log_in
    end
    feature "User Setting Dashboard" do
        before(:each) do
            visit "/users/#{@user.id}/edit"
        end
        scenario "visit users edit page" do
            expect(page).to have_field('email')
            expect(page).to have_field('name')
        end
        scenario "inputs filled out correctly" do
            expect(find_field("name").value).to eq(@user.name)
            expect(find_field("email").value).to eq(@user.email)
        end
        scenario "incorrectly updates information" do
            fill_in "name", with: "Another Name"
            fill_in "email", with: "incorrect email format"
            click_button "Update"
            expect(current_path).to eq("/users/#{@user.id}/edit")
            expect(page).to have_text("Email is invalid")
        end
        scenario "correctly updates information" do
            fill_in "name", with: "Another Name"
            fill_in "email", with: "correct@email.com"
            fill_in "password", with: "password"
            fill_in "password_confirmation", with: "password"
            click_button "Update"
            expect(page).to have_text("Another Name")
        end
        scenario "destroys user and redirects to registration page" do
            click_button 'Delete Account'
            expect(current_path).to eq('/users/new')
        end
    end
end
