# == Schema Information
#
# Table name: order_items
#
#  id         :integer          not null, primary key
#  order_id   :integer
#  item_id    :integer
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe OrderItems do

  let(:order)   {FactoryGirl.create(:order)}
  let (:item)   {FactoryGirl.create(:item)}

  before {@order_item = order.orderitems.build(item_id: 1, quantity:5)}

  it {should respond_to(:item_id)}
  it {should respond_to(:quantity)}

end
