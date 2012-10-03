require 'spec_helper'

describe "UserPages" do

  subject {page}

  describe "Signup" do
    before {visit signup_path}
    let(:submit) {"Create Account"}

    describe "with valid information" do
      before do
        fill_in "Email Address", with:"user@example.com"
        fill_in "Password",      with:"password"
        fill_in "Confirm Password", with:"password"
      end

      it "should create a user" do
        expect {click_button submit}.to change(User, :count).by(1)
      end
    end
  end

end
