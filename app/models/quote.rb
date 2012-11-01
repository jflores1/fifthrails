# == Schema Information
#
# Table name: quotes
#
#  id                 :integer          not null, primary key
#  customer_type      :string(255)
#  customer_need      :string(255)
#  customer_location  :integer
#  customer_need_date :date
#  quote_email        :string(255)
#  quote_phone_number :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Quote < ActiveRecord::Base
  attr_accessible :customer_location, :customer_need, :customer_need_date, :customer_type, :quote_email, :quote_phone_number

  #constants
  CUSTOMER_TYPE = %w[Residential Business]
  CUSTOMER_NEED = %w[Storage Moving Both]
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  #out of the box validations
  validates :customer_type, :customer_need, :customer_location, :quote_email, :customer_need_date, :quote_phone_number, presence: true
  validates :customer_location, length:{is:5}
  validates :quote_email, format:{with: VALID_EMAIL_REGEX}
  validates :quote_phone_number, length:{in: 7..13}

  #custom validations
  validate  :valid_customer_type, :valid_customer_need

  #callbacks
  before_save do |quote|
    quote.customer_type = customer_type.capitalize
    quote.customer_need = customer_need.capitalize
    quote.quote_phone_number = quote_phone_number.gsub(/\D/,'')
  end

  after_save :new_quote_notification

  #methods
  def valid_customer_type
    errors.add(:customer_type, message:"Sorry, that's not a valid customer type") unless CUSTOMER_TYPE.include? customer_type
  end

  def valid_customer_need
    errors.add(:customer_need, message:"Sorry, we only do moving or storage") unless CUSTOMER_NEED.include? customer_need
  end

  #private methods
  private
  def new_quote_notification
    QuoteMailer.new_quote(self).deliver
  end

end
