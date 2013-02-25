require 'spec_helper'

describe "OrderPages" do
  let(:user){create(:user)}
  before do
  	visit root_path
  	fill_in_login_form
  end

  describe "the user order index page" do
  	before {visit user_orders_path(user)}
  	it {page.should have_selector('title', text: "#{user.full_name}'s Orders")}
  	it {page.should have_selector('a', text: "Scheduled Pickups")}
  	it {page.should have_selector('a', text: "Scheduled Deliveries")}
  	it {page.should have_selector('a', text: "Schedule Pickup")}

  	context "with nothing scheduled" do
  		it {page.should have_content("You don't have any pickups scheduled.")}
  		it {page.should have_content("You don't have any deliveries scheduled.")}
  	end

  	context "with a pickup scheduled" do
  		before do
  			user.orders.create(attributes_for(:order, address_id: 1))
  			visit user_orders_path(user)
  		end
      it {print page.html}
  		it {page.should have_selector("th", text: "Pickup Date")}
  	end
  end

  describe "scheduling a pickup" do
  	before do
      user.addresses.create(attributes_for(:address))
      visit new_user_order_path(user)
    end
  	it {page.should have_selector("title", text: "Schedule pickup for #{user.full_name}")}
    it "schedules a pickup" do
      expect{
        valid_pickup_form
      }.to change(user.orders, :count).by(1)
    end
  end

  private
  def fill_in_login_form
    fill_in "user_email",    with: user.email
    fill_in "user_password", with: user.password  
    click_button "Sign In"
  end

  def valid_pickup_form
    fill_in "datepicker",       with: "2013-03-01"
    select "Home",              from: "order_address_id"
    click_button "Schedule Service"
  end
end
