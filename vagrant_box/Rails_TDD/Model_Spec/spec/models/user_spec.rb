require 'rails_helper'

RSpec.describe User do
    context "With valid attributes" do
        it "should save" do
            user = User.new(
            first_name: "Jian",
            last_name: "Zhang",
            email: "jzhang@gmail.com"
            )
            expect(user).to be_valid
        end
    end

    context "With invalid attributes" do
      it "should not save if first_name field is blank" do
          user = User.new(
              first_name: '',
              last_name: 'Zhang',
              email: 'jzhang@email.com'
          )
        expect(user).to be_invalid
      end

      it "should not save if last_name field is blank" do
          user = User.new(
              first_name: 'Jian',
              last_name: '',
              email: 'jzhang@email.com'
          )
        expect(user).to be_invalid
      end

      it "should not save if email already exists" do
          User.create(
            first_name: "Donald",
            last_name: "Trump",
            email: "dtrump@mail.com"
          )
          user = User.new(
            first_name: "Donald",
            last_name: "Glover",
            email: "dtrump@mail.com"
          )
          expect(user).to be_invalid
      end

      it "should not save if invalid email format" do
          user = User.new(
            first_name: "Jesus",
            last_name: "Christ",
            email: "jesus@christ"
          )
          expect(user).to be_invalid
      end

    end
end
