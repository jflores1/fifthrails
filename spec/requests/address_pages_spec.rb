require 'spec_helper'

describe "AddressPages" do
	let(:user){create(:user)}
	before do
		visit root_path
		fill_in_login_form
	end

  describe "the user's index page" do  	
  	before do
  		visit user_addresses_path(user)
  	end
  	
  	it {page.should have_content("Jesse's Saved Addresses")}
  	it {page.should have_selector("a", text: "Add a new address")}

  	context "without any addresses" do
  		it {page.should have_content("You don't have any saved addresses yet.")}
  		it {page.should_not have_selector("table")}
  	end
  end

  describe "add a new address" do
  	before do
  		visit new_user_address_path(user)
  	end
  	it {page.should have_selector("form")}
  end

  private
  def fill_in_login_form
    fill_in "user_email",    with: user.email
    fill_in "user_password", with: user.password  
    click_button "Sign In"
  end

end
