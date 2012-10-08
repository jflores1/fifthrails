require 'spec_helper'

describe AccountsController do
  render_views

  let(:user) {FactoryGirl.create(:user)}

  describe "Create method" do
    it "should redirect to index with a notice on successful save" do

      sign_in(user)
      user.build_account.stub(:account).and_return(true)
      post 'create'
      response.should redirect_to(user_account_path(user))
    end

    it "should redirect to the account page with unsuccessful save" do
      sign_in(user)
      user.build_account.stub(:account).and_return(false)
      post'create'
      response.should render_template('new')
    end
  end

end
