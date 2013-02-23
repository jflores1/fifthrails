require 'spec_helper'

describe "UserPages" do

  describe "from the home page" do
    let!(:user){create(:user)}
    before {visit root_path}
    it "allows a user to log into their storage locker" do
      fill_in_login_form
      current_path.should eq(user_path(user))
    end
  end

  describe "creating a new account" do
    before {visit new_user_registration_path}
    describe "with valid information" do
      it "creates a new user" do
        expect {fill_in_form_with_valid_info}.to change(User, :count).by(1)
      end
    end
  end

  describe "the user's profile page" do
    let!(:user){create(:user)}
    before do
      visit root_path
      fill_in_login_form
    end
    it {page.should_not have_selector("form", id: 'new_user')}
    it {page.should have_content(user.first_name)}
  end

  private
  def fill_in_form_with_valid_info
    fill_in "user_email",                 with: "new_user@test.com"
    fill_in "user_password",              with: "password"
    fill_in "user_password_confirmation", with: "password"
    fill_in "user_first_name",            with: "Jesse"
    fill_in "user_last_name",             with: "Flores"
    fill_in "user_phone_number",          with: "123-456-7890"
    click_button "Sign up"
  end

  def fill_in_login_form
    fill_in "user_email",    with: "jesse@test.com"
    fill_in "user_password", with: "password"  
    click_button "Sign In"
  end

end
