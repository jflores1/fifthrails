# == Schema Information
#
# Table name: items
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  item_type        :string(255)
#  price            :float
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  account_id       :integer
#  item_length      :float
#  item_width       :float
#  item_height      :float
#  item_status      :string(255)
#  item_description :text
#

require 'spec_helper'

describe Item do

  #Basic Item Construction
  let(:account) {FactoryGirl.create(:account)}
  before {@item = Item.new(name:"Item", item_type:"Product", price:"15.55", account_id:1, item_length:"2.4", item_width:"3.5", item_height:"4.6", item_status:"stored", item_description:"Some Item")}

  it {should respond_to(:name)}
  it {should respond_to(:item_type)}
  it {should respond_to(:price)}
  it {should respond_to(:account_id)}
  it {should respond_to(:item_length)}
  it {should respond_to(:item_width)}
  it {should respond_to(:item_height)}
  it {should respond_to(:item_status)}
  it {should respond_to(:item_description)}

  #Item Validation
  describe "Item should have a name" do
    before {@item.name=""}
    it {should_not be_valid}
  end

  #Tests related to item type
  describe "Item type should be present" do
  before {@item.item_type = ""}
  it {should_not be_valid}
  end

  describe "Item type is not in array" do
  before {@item.item_type = "Box"}
  it {should_not be_valid}
  end

  describe "Item type is in array" do
    before {@item.item_type = "Customer"}
    it {should be_valid}
  end #this fails in rspec, passes in console

  describe "Account ID can be blank" do
    before {@item.account_id =""}
    it {should be_valid}
  end


  #Item Relationships

end
