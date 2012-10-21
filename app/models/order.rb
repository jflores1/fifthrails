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
#  address_id   :integer
#  order_type   :string(255)
#

class Order < ActiveRecord::Base
  attr_accessible :order_date, :order_amount, :order_notes, :referral, :address_id, :order_type, :order_status, :item_ids, :addresses_attributes, :order_items_attributes, :items_attributes
  belongs_to :user
  has_many   :addresses
  has_many   :order_items
  has_many   :items, through: :order_items

  accepts_nested_attributes_for :order_items, allow_destroy: true
  accepts_nested_attributes_for :items

  ORDER_TYPES = %w[Pickup Delivery]
  ORDER_STATUS = %w[Active Complete]

  #Validations
  #validates :order_amount, presence: true
  validate :order_date, presence: true
  validate :valid_order_date
  validate :valid_order_type
  validate :valid_order_status

  def valid_order_date
    if !order_date.nil?
      errors.add(:order_date, "Sorry, we need 24 hours of notice!") unless order_date >= Date.tomorrow
    end
  end

  def valid_order_type
    errors.add(:order_type, "Sorry, that's not a valid order type") unless ORDER_TYPES.include? order_type
  end

  def valid_order_status
    errors.add(:order_status, "Sorry that's not a valid order status") unless ORDER_STATUS.include? order_status
  end

  #Scopes
  scope :pickup, where(:order_type => "Pickup")
  scope :delivery, where(:order_type => "Delivery")
  scope :active, where(:order_status => "Active")
  scope :complete, where(:order_status => "Complete")

  #Queries
  def nickname
    Order.joins('LEFT OUTER JOIN addresses ON addresses.id = address_id').pluck(:nickname)
  end

end
