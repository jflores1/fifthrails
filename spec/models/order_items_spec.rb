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

  let(:account) {FactoryGirl.create(:account)}
  let(:address) {FactoryGirl.create(:address)}
  let(:order)   {FactoryGirl.create(:order)}

end
