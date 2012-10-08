require 'spec_helper'

describe "UserPages" do

  subject {page}

  describe "Signup" do
    before {visit signup_path}
    let(:submit) {"Create Account"}

    describe "with valid information" do
      before do
        fill_in "Email Address",    with:"user@example.com"
        fill_in "Password",         with:"password"
        fill_in "Confirm Password", with:"password"
        fill_in "First Name",       with:"First"
        fill_in "Last Name",        with:"Last"
        fill_in "Middle Initial",   with:"M"
        fill_in "Home Phone",       with:"555-555-5555"
        fill_in "Cell Phone",       with:""
        fill_in "Work Phone",       with:""
      end

      it "should create a user" do
        expect {click_button submit}.to change(User, :count).by(1)
      end
    end
  end

end
