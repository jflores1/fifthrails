# == Schema Information
#
# Table name: orders
#
#  id           :integer          not null, primary key
#  order_amount :float
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  order_notes  :text
#  referral     :string(255)
#  user_id      :integer
#  address_id   :integer
#  order_type   :string(255)
#  order_status :string(255)      default("Active")
#  order_date   :date
#

require 'spec_helper'

describe Order do

  let(:user) {FactoryGirl.create(:user)}
  let(:address) {FactoryGirl.create(:address)}

  before {@order = user.orders.build(order_date:"2012-12-29", order_amount:"25.00", address_id: 1, order_notes:"",
                                     order_type:"Pickup", order_status:"Active")}

  it {should respond_to(:order_date)}
  it {should respond_to(:order_amount)}
  it {should respond_to(:address_id)}

  describe "Order validations" do

    describe "Order date validations" do

      describe "Order date can't be in the past" do
        before {@order.order_date <= Date.today}
        it {should_not be_valid}
      end

      describe "Order date must be at least 1 day in the future" do
        before {@order.order_date = Date.tomorrow}
        it {should be_valid}
      end
    end


  end

  context "It sends emails when new orders are received" do
    describe "when a new order is placed" do
      it "alerts us with an email" do
        @order.save!
        last_email.to.should include("service@fifthroomstorage.com")
      end
    end
  end

end
