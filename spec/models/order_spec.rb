# == Schema Information
#
# Table name: orders
#
#  id           :integer          not null, primary key
#  order_date   :datetime
#  account_id   :integer
#  order_amount :float
#  address_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'spec_helper'

describe Order do

  let(:account) {FactoryGirl.create(:account)}
  let(:address) {FactoryGirl.create(:address)}

  before {@order = account.orders.build(order_date:"2012-09-29", order_amount:15.45, address_id:1)}

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
        before {@order.order_date >= Date.tomorrow}
        it {should be_valid}
      end
    end


  end

end
