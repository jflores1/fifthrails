require 'spec_helper'

describe OrdersController do
  render_views

  let(:user) {FactoryGirl.create(:user)}

  describe "Create a new order" do

    it "should redirect to Address" do
      sign_in(user)
      post'create'
      user.orders.new.stub(:order).and_return(true)
      response.should render_template('addresses/new')
    end


    it "should re-render order template if unsuccessful"

  end

end
