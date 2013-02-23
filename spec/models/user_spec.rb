# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string(255)
#  middle_initial         :string(255)
#  last_name              :string(255)
#  phone_number           :string(255)
#  admin                  :boolean          default(FALSE)
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#

require 'spec_helper'

describe User do
  let(:user){FactoryGirl.build(:user)}
  subject {user}

  describe "a working model" do
    it {expect{user.save}.to change(User, :count).by(1)}

    it {should respond_to(:email)}
    it {should respond_to(:addresses)}
    it {should respond_to(:first_name)}
    it {should_not respond_to(:middle_initial)}
    it {should respond_to(:last_name)}
    it {should respond_to(:phone_number)}
    it {should respond_to(:company)}

    describe "has validations" do
      describe "phone_number isn't too short" do
        before {user.phone_number = "a"*6}
        it "does not add a phone number" do
          expect {user.save}.to_not change(User, :count).by(1)
        end
        it "raises an error" do
          expect {user.save!}.to raise_error(ActiveRecord::RecordInvalid)
        end
      end

      describe "phone number isn't too long" do
        before {user.phone_number = "a"*17}
        it "does not add a User record" do
          expect {user.save}.to_not change(User, :count).by_at_least(1)
        end
        it "raises an error" do
          expect {user.save!}.to raise_error(ActiveRecord::RecordInvalid)
        end
      end

    end
  end

  

end
