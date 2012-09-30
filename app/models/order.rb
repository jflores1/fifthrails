# == Schema Information
#
# Table name: orders
#
#  id           :integer          not null, primary key
#  order_date   :datetime
#  account_id   :integer
#  order_amount :float
#  address_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Order < ActiveRecord::Base
  attr_accessible :address_id, :order_date, :order_amount
  belongs_to :account
  has_many   :addresses

  validates :address_id, presence:true
  validates :order_amount, presence: true
  validate :valid_order_date

  def valid_order_date
    if !order_date.nil?
      errors.add(:order_date, "Sorry, we need 24 hours of notice!") unless order_date >= Date.tomorrow
    end
  end
end
