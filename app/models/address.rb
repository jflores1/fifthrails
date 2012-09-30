# == Schema Information
#
# Table name: addresses
#
#  id             :integer          not null, primary key
#  address_line_1 :string(255)
#  address_line_2 :string(255)
#  city           :string(255)
#  state          :string(255)
#  zip_code       :integer
#  account_id     :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  address_type   :string(255)
#

class Address < ActiveRecord::Base
  attr_accessible :address_line_1, :address_line_2, :city, :state, :zip_code, :address_type
  belongs_to :account
  belongs_to :order

  before_save {|address| address.address_type = address_type.capitalize}

  validates :address_line_1, :city, :state, :zip_code, :address_type, presence: true
  validates :state, length: {is: 2}
  validates :zip_code, length: {is: 5}

  ADDRESS_TYPES = %w[Billing Shipping Both]
  validate :valid_address_type

  protected
  def valid_address_type
    errors.add(:address_type, "Sorry, not a valid address type") unless ADDRESS_TYPES.include? address_type
  end

end
