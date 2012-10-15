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

class OrderItem < ActiveRecord::Base
  attr_accessible :item_id, :quantity, :order_id
  belongs_to :order
  belongs_to :item

  validates :item, presence: true
  #validates :quantity, presence: true, :allow_blank => true

end
