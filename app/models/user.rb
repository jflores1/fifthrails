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
#

class User < ActiveRecord::Base
  attr_accessible :email_address, :password, :password_confirmation
  has_secure_password
  has_one :account, dependent: :destroy
  accepts_nested_attributes_for :account, :update_only => true

  before_save {|user| user.email_address = email_address.downcase}
  before_save :create_remember_token

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email_address, presence: true,
            length: {maximum: 50},
            format:{with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false}
  validates :password, presence:true, length:{minimum:6}
  validates :password_confirmation, presence:true

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end


end
