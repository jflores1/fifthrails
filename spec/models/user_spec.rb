# == Schema Information
#
# Table name: users
#
#  id                    :integer          not null, primary key
#  email_address         :string(255)
#  password              :string(255)
#  password_confirmation :string(255)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  password_digest       :string(255)
#  remember_token        :string(255)
#  first_name            :string(255)
#  middle_initial        :string(255)
#  last_name             :string(255)
#  phone_number          :string(255)
#

require 'spec_helper'

describe User do
  before {@user = User.new(email_address:"jesse.flores@me.com", password: "password", password_confirmation: "password", first_name:"Jesse", middle_initial:"A", last_name:"Flores", home_phone:"713-817-7622", work_phone:"512-468-7549", cell_phone:"713-817-7622")}

  subject {@user}

  it {should respond_to(:email_address)}
  it {should respond_to(:password_digest)}
  it {should respond_to(:password)}
  it {should respond_to(:password_confirmation)}
  it {should respond_to(:authenticate)}
  it {should respond_to(:remember_token)}
  it {should respond_to(:addresses)}
  it {should respond_to(:first_name)}
  it {should respond_to(:middle_initial)}
  it {should respond_to(:last_name)}
  it {should respond_to(:home_phone)}
  it {should respond_to(:work_phone)}
  it {should respond_to(:cell_phone)}

  it {should be_valid}

  describe "when email is not present" do
    before {@user.email_address = ""}
    it {should_not be_valid}
  end

  describe "when email is too long" do
    before {@user.email_address = "a" * 51}
    it {should_not be_valid}
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[users@foo,com user_at_foo.org example.users@foo. foo@bar_baz.com]
      addresses.each do |invalid_address|
        @user.email_address = invalid_address
        @user.should_not be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[users@foo.com A_US-ER@f.b.org frst.last@foo.jp]
      addresses.each do |valid_address|
        @user.email_address = valid_address
        @user.should be_valid
      end
    end
  end

  describe "when email address is already taken"  do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.save
    end

    it {should_not be_valid}
  end

  describe "when password is not present" do
    before {@user.password = @user.password_confirmation = " "}
    it {should_not be_valid}
  end

  describe "when password doesn't match confirmation" do
    before {@user.password_confirmation = "mismatch"}
    it {should_not be_valid}
  end

  describe "when password confirmation is nil" do
    before {@user.password_confirmation = nil }
    it {should_not be_valid}
  end


  describe "when first name is not present" do
    before {@user.first_name = nil}
    it {should_not be_valid}
  end

  describe "validation of middle name" do
    describe "when middle name is not present" do
      before {@user.middle_initial = nil}
      it {should be_valid}
    end

    describe "when middle initial is present, it's just 1 initial" do
      before {@user.middle_initial = "a" *2}
      it {should_not be_valid}
    end
  end

  describe "phone number validation" do
    before {@user.home_phone = @user.cell_phone = @user.work_phone = nil}
    it {should be_valid}

    describe "phone number shouldn't be too long" do
      before {@user.home_phone = @user.cell_phone = @user.work_phone = "a" * 17}
      it {should_not be_valid}
    end

    describe "phone number shouldn't be too short" do
      before {@user.home_phone = @user.cell_phone = @user.work_phone = "a" * 5}
      it {should_not be_valid}
    end
  end

    it {should respond_to(:authenticate)}

  describe "return value of authenticate method" do
    before {@user.save}
    let(:found_user) {User.find_by_email(@user.email_address)}

    describe "with valid password" do
      it {should == found_user.authenticate(@user.password)}
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) {found_user.authenticate("invalid")}

      it {should_not == user_for_invalid_password}
      specify {user_for_invalid_password.should be_false}
    end

    describe "with password that's too short" do
      before {@user.password = @user.password_confirmation = "a" * 5}
      it {should be_invalid}
    end
  end

  describe "remember token" do
    before {@user.save}
    its(:remember_token) {should_not be_blank}
  end



end
