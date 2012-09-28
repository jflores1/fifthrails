# == Schema Information
#
# Table name: accounts
#
#  id             :integer          not null, primary key
#  first_name     :string(255)
#  middle_initial :string(255)
#  last_name      :string(255)
#  home_phone     :string(255)
#  work_phone     :string(255)
#  cell_phone     :string(255)
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'spec_helper'

describe Account do

  let(:user)    {FactoryGirl.create(:user)}
  before {@account = user.build_account(first_name:"Jesse", middle_initial:"A", last_name:"Flores", home_phone:"713-817-7622", work_phone:"512-468-7549", cell_phone:"713-817-7622")}

  subject {@account}

  it {should respond_to(:first_name)}
  it {should respond_to(:middle_initial)}
  it {should respond_to(:last_name)}
  it {should respond_to(:home_phone)}
  it {should respond_to(:work_phone)}
  it {should respond_to(:cell_phone)}
  its(:user){should == user}

  it {should be_valid}
  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Account.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

  describe "when user_is is not present" do
    before {@account.user_id = nil}
    it {should_not be_valid}
  end

  describe "when first name is not present" do
    before {@account.first_name = nil}
    it {should_not be_valid}
  end

  describe "validation of middle name" do
    describe "when middle name is not present" do
      before {@account.middle_initial = nil}
      it {should be_valid}
    end

    describe "when middle initial is present, it's just 1 initial" do
      before {@account.middle_initial = "a" *2}
      it {should_not be_valid}
    end
  end

  describe "phone number validation" do
    before {@account.home_phone = @account.cell_phone = @account.work_phone = nil}
    it {should be_valid}

    describe "phone number shouldn't be too long" do
      before {@account.home_phone = @account.cell_phone = @account.work_phone = "a" * 17}
      it {should_not be_valid}
    end

    describe "phone number shouldn't be too short" do
      before {@account.home_phone = @account.cell_phone = @account.work_phone = "a" * 5}
      it {should_not be_valid}
    end

  end



end
