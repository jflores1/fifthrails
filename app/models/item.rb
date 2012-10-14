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
#  item_length      :float
#  item_width       :float
#  item_height      :float
#  item_status      :string(255)
#  item_description :text
#  user_id          :integer
#

class Item < ActiveRecord::Base
  attr_accessible :name, :item_type, :price, :account_id, :item_length, :item_width, :item_height, :item_status, :item_description
  has_many :order_items
  has_many :orders, through: :order_items
  belongs_to :user

  before_validation do |item|
    item.item_type = item_type.capitalize
    item.item_status = item_status.capitalize
  end

  before_save do |item|
    item.name = name.capitalize
    item.item_type = item_type.capitalize
    item.item_status = item_status.capitalize
  end

  VALID_ITEM_TYPES =  %w[Product Customer]
  VALID_ITEM_STATUS = ["Customer", "Stored", "In transit", "Out for delivery"]

  validates :name, presence: true
  validates :item_type, presence: true
  validates :item_status, presence: true, allow_blank: true, allow_nil:true

  validate :valid_item_type
  validate :valid_item_status

  def valid_item_type
    errors.add(:item_type, "Sorry, that's not a valid item type!") unless VALID_ITEM_TYPES.include? item_type
  end

  def valid_item_status
    errors.add(:item_status, "Sorry, that's not a valid status!") unless VALID_ITEM_STATUS.include? item_status
  end

  #scope
  scope :stored, where(:item_status => "Stored")
  scope :with_customer, where(:item_status => "Customer")
end
