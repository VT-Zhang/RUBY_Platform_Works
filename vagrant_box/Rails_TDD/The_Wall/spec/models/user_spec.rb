require 'rails_helper'

RSpec.describe User, type: :model do
    # Username field: must be required, must be unique, must be longer than 5 characters
    it "should not save if username field is blank" do
        user = User.new(username: "")
        expect(user).to be_invalid
    end

    it "username must be unqiue" do
        User.create(username: "kingoftheworld")
        user = User.new(username: "kingoftheworld")
        expect(user).to be_invalid
    end

    it "username must be longer than 5 characters" do
        user = User.new(username: "jack")
        expect(user).to be_invalid
    end
end
