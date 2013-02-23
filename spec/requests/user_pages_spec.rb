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
    let(:pickup_button){"Schedule a Pickup"}
    let(:delivery_button){"Schedule a Delivery"}
    before do
      visit root_path
      fill_in_login_form
    end
    it {page.should_not have_selector("form", id: 'new_user')}
    it {page.should have_content(user.first_name)}

    context "the user has nothing stored" do
      it {page.should have_selector("a", text: pickup_button)}
      it {page.should_not have_selector("a", text: delivery_button)}
    end

    context "the user has some stuff stored" do
      before do
        5.times do
          user.items.create(attributes_for(:item))
        end
        visit user_path(user)
      end
      it {page.should have_selector("a", text: pickup_button)}
      it {page.should have_selector("a", text: delivery_button)}
      it {page.should have_selector("table")}
    end

    context "can navigate to other pages" do
      before do
        visit user_path(user)
      end
      it "allows a user to add an address" do
        find(".user-menu").click
        click_link("Manage Addresses")
        current_path.should eq(user_addresses_path(user))
      end
    end
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
