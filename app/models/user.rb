# == Schema Information
#
# Table name: users
#
#  id                    :integer          not null, primary key
#  email_address         :string(255)
#  password              :string(255)
#  password_confirmation :string(255)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  password_digest       :string(255)
#  remember_token        :string(255)
#  first_name            :string(255)
#  middle_initial        :string(255)
#  last_name             :string(255)
#  phone_number          :string(255)
#  admin                 :boolean          default(FALSE)
#

class User < ActiveRecord::Base
  attr_accessible :email_address, :password, :password_confirmation, :phone_number, :first_name, :last_name, :middle_initial
  has_secure_password
  has_many :addresses
  has_many :orders, include: :addresses
  has_many :items

  accepts_nested_attributes_for :addresses

  before_save {|user| user.email_address = email_address.downcase}
  before_save :create_remember_token

  #strip digits and return string of numbers
  before_save do |account|
    account.phone_number = phone_number.gsub(/\D/,'')
  end

  before_save do |account|
    account.first_name = first_name.capitalize
    account.last_name  = last_name.capitalize
    account.middle_initial = middle_initial.capitalize
  end

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email_address, presence: true,
            length: {maximum: 50},
            format:{with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false}
  validates :password, presence:true, length:{minimum:6}
  validates :password_confirmation, presence:true
  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :middle_initial, length:  {is: 1}, allow_blank: true
  validates :phone_number, length: {in: 7..16}

  #scope
  scope :admin, where(:admin => true)

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end


end
