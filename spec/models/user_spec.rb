# == Schema Information
#
# Table name: users
#
#  id             :integer          not null, primary key
#  email          :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  first_name     :string(255)
#  middle_initial :string(255)
#  last_name      :string(255)
#  phone_number   :string(255)
#  admin          :boolean          default(FALSE)
#

require 'spec_helper'

describe User do
  before {@user = User.new(email:"jesse.flores@me.com", first_name:"Jesse", middle_initial:"A", last_name:"Flores", phone_number: '123-456-7890')}

  describe "a working model" do
    before {@user.save!}
    it {should change(User, :count).by(1)}
  end

  it {should respond_to(:email)}
  it {should respond_to(:addresses)}
  it {should respond_to(:first_name)}
  it {should respond_to(:middle_initial)}
  it {should respond_to(:last_name)}
  it {should respond_to(:phone_number)}

end
