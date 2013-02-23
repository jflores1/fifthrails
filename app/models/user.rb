# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string(255)
#  middle_initial         :string(255)
#  last_name              :string(255)
#  phone_number           :string(255)
#  admin                  :boolean          default(FALSE)
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :email, :password, :password_confirmation, :phone_number, :first_name, :last_name, :company
  has_many :addresses
  has_many :orders, include: :addresses
  has_many :items

  accepts_nested_attributes_for :addresses

  #strip digits and return string of numbers
  before_save do |account|
    account.phone_number = phone_number.gsub(/\D/,'')
  end

  before_save do |account|
    account.first_name = first_name.capitalize
    account.last_name  = last_name.capitalize
  end
  #TODO: remove middle_initial, add company

  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :phone_number, length: {in: 7..16}

  #scope
  scope :admin, where(:admin => true)


  #class methods
  def make_admin
    self.toggle!(:admin)
  end

  def full_name
    [first_name, last_name].join(' ')
  end

end
