require 'rails_helper'

RSpec.describe Message, type: :model do
    # Message field: must be required, must be longer than 10 characters
    # User Reference field: must be required
    
    it "should not save if the message field is blank" do
        message = Message.new(message: "", user: User.first)
        expect(message).to be_invalid
    end

    it "message field must be longer than 10 characters" do
        message = Message.new(message:"Great", user: User.first)
        expect(message).to be_invalid
    end

    it "should not save if the reference field is blank" do
        message = Message.new(message:"This is the message...", user: User.first)
        expect(message).to be_invalid
    end
end
