require 'spec_helper'

describe "AddressPages" do
	let(:user){create(:user)}
	before do
		visit root_path
		fill_in_login_form
	end

  describe "the user's address index page" do  	
  	before do
  		visit user_addresses_path(user)
  	end
  	
  	it {page.should have_content("Jesse's Saved Addresses")}
  	it {page.should have_selector("a", text: "Add a new address")}

  	context "without any addresses" do
  		it {page.should have_content("You don't have any saved addresses yet.")}
  		it {page.should_not have_selector("table")}
  	end

  	context "with an address" do
      before do
        user.addresses.create(attributes_for(:address))
  			visit user_addresses_path(user)
  		end
  		it "deletes an address" do
  			expect{
  				click_link("Delete Address")
  			}.to change(user.addresses, :count).by(-1)
  		end
  	end
  end

  describe "add a new address" do
  	before do
  		visit new_user_address_path(user)
  	end
  	it {page.should have_selector("form")}
  	it "adds a new address for the user" do
  		fill_in_address_form
  		user.addresses.last.address_line_1.should eq("Address 1")
  	end
  	it "does not add a user with invalid info" do
  		fill_in_invalid_address_form
  		page.should have_content("Sorry, but this form contains the following ")
  	end
  end

  private
  def fill_in_login_form
    fill_in "user_email",    with: user.email
    fill_in "user_password", with: user.password  
    click_button "Sign In"
  end

  def fill_in_address_form
  	fill_in "address_address_line_1", with: "Address 1"
  	fill_in "address_address_line_2", with: "Address 2"
  	fill_in "address_city",						with: "City"
  	select "GA", 											from: "address_state"
  	fill_in "address_zip_code",				with: "12345"
  	fill_in "address_nickname",				with: "Nickname"
  	select "Pickup",									from: "address_address_type"
  	click_button "Save"
  end

  def fill_in_invalid_address_form
  	fill_in "address_address_line_1", with: "Address 1"
  	fill_in "address_address_line_2", with: "Address 2"
  	fill_in "address_city",						with: "City"
  	select "GA", 											from: "address_state"
  	fill_in "address_zip_code",				with: "12345"
  	select "Pickup",									from: "address_address_type"
  	click_button "Save"
  end

end
