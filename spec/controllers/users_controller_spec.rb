require 'spec_helper'

describe UsersController do

  let(:user) {FactoryGirl.create(:user)}

  it "should show the current user" do
    User.stub(:find) {:user}
  end

  it "should create new users" do
    @user = User.new(email_address:"jesse@test2.com", password:"newpassword", password_confirmation:"newpassword")
    expect {@user.save!}.to change(User, :count).by(1)
    expect {response.should redirect_to(user_path)}
  end

end
