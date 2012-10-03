require 'spec_helper'

describe "AccountPages" do

  subject {page}

  let(:user) {FactoryGirl.create(:user)}
  before {sign_in user}

  describe "Create Account" do
    before {visit new_account_path}
    let(:submit) {"Complete Account"}

    it {should have_selector("title", text: "Create Account")}

    describe "with valid information" do
      before do
        fill_in "First Name", with: "First Name"
        fill_in "Middle Initial", with: ""
        fill_in "Last Name", with: "Last Name"
        fill_in "Home Phone", with: "555-555-5555"
        fill_in "Cell Phone", with: ""
        fill_in "Work Phone", with:""
      end
      it "should create an account" do
        expect {click_button submit}.to change(Account, :count).by(1)
      end
    end
  end
end
