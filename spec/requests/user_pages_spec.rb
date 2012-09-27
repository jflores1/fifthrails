require 'spec_helper'

describe "UserPages" do

  subject {page}

  describe "signup" do
    before {visit signup_path}
    let(:submit) {"Create Account"}

    describe "with invalid information" do
      it "should not create a users" do
        expect {click_button submit}.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Email Address",      with: "jesse@test.com"
        fill_in "Password",           with: "password"
        fill_in "Confirm Password",   with: "password"
      end

      it "should create a users" do
        expect {click_button submit}.to change(User, :count).by(1)
      end
    end
  end

end
