require 'spec_helper'

describe "StorageRentalPages" do

  subject {page}

  describe "the single page approach" do
    before {visit root_path}
    it "finds the home path" do
      find_link("Home").click
      current_path.should eq(home_path)
    end
    it "finds the business path" do
      find_link("Business").click
      current_path.should eq(business_path)
    end

    it {page.should have_selector("a", text: "contact us!")}
  end

end
