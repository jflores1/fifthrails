# == Schema Information
#
# Table name: orders
#
#  id           :integer          not null, primary key
#  order_date   :datetime
#  order_amount :float
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  order_notes  :text
#  referral     :string(255)
#  user_id      :integer
#

class Order < ActiveRecord::Base
  attr_accessible :order_date, :order_amount, :order_notes, :referral, :address_id, :addresses_attributes
  belongs_to :user
  has_many   :addresses
  has_many   :order_items
  has_many   :items, through: :order_items

  accepts_nested_attributes_for :addresses, allow_destroy: true

  #validates :order_amount, presence: true
  validate :order_date, presence: true
  validate :valid_order_date

  def valid_order_date
    if !order_date.nil?
      errors.add(:order_date, "Sorry, we need 24 hours of notice!") unless order_date >= Date.tomorrow
    end
  end
end
