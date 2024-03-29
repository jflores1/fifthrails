# == Schema Information
#
# Table name: addresses
#
#  id             :integer          not null, primary key
#  address_line_1 :string(255)
#  address_line_2 :string(255)
#  city           :string(255)
#  state          :string(255)
#  zip_code       :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  address_type   :string(255)
#  user_id        :integer
#  order_id       :integer
#  nickname       :string(255)
#

require 'spec_helper'

describe Address do

  #Generate related factories
  let(:user) {FactoryGirl.create(:user)}
  let(:account) {FactoryGirl.create(:account)}

  #Test basic construction
  before {@address = account.addresses.build(address_line_1:"4591 Derby Ln Se", address_line_2:"", city:"Smyrna", state:"GA", zip_code:"30082", address_type:"Billing")}

  subject {@address}
  it {should respond_to(:address_line_1)}
  it {should respond_to(:address_line_2)}
  it {should respond_to(:city)}
  it {should respond_to(:state)}
  it {should respond_to(:zip_code)}
  it {should respond_to(:address_type)}

  #Test validation methods
  describe "Address Validators" do

    describe "Verify presence of address line 1" do
      before {@address.address_line_1 = ""}
      it {should_not be_valid}
    end

    describe "Address line 2 is optional" do
      describe "Address line 2 is present" do
        before {@address.address_line_2}
        it {should be_valid}
      end

      describe "Address line 2 is not present" do
        before {@address.address_line_2 = ""}
        it {should be_valid}
      end
    end

    describe "Verify presence of city" do
      before {@address.city = ""}
      it {should_not be_valid}
    end

    describe "Verify presence and length of State" do
      describe "Verify presence of state" do
        before {@address.state = ""}
        it {should_not be_valid}
      end

      describe "Verify state is not too short" do
        before {@address.state = "a"}
        it {should_not be_valid}
      end

      describe "Verify state is not too long" do
        before {@address.state = "a" * 3}
        it {should_not be_valid}
      end
    end

    describe "Verify presence and length of zip code" do
      describe "Verify presence of zip code" do
        before {@address.zip_code = ""}
        it {should_not be_valid}
      end

      describe "Verify length of zip code" do
        before {@address.zip_code = 9999}
        it {should_not be_valid}
      end

      describe "Verify zip code isn't too long" do
        before {@address.zip_code = 111111}
        it {should_not be_valid}
      end
    end


    describe "Verify presence of Address Type" do
      before {@address.address_type = ""}
      it {should_not be_valid}
    end

    describe "Verify address type criteria" do
      before {@address.address_type = "Not Valid"}
      it {should_not be_valid}
    end

    describe "Verify Billing is an appropriate address type" do
      before {@address.address_type = "Billing"}
      it {should be_valid}
    end

    describe "Verify Shipping is an appropriate address type" do
      before {@address.address_type = "Shipping"}
      it {should be_valid}
    end

    describe "Verify Both is an appropriate address type" do
      before {@address.address_type = "Both"}
      it {should be_valid}
    end

  end


end
