# == Schema Information
#
# Table name: users
#
#  id             :integer          not null, primary key
#  email          :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  first_name     :string(255)
#  middle_initial :string(255)
#  last_name      :string(255)
#  phone_number   :string(255)
#  admin          :boolean          default(FALSE)
#

class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :phone_number, :first_name, :last_name, :middle_initial
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
    account.middle_initial = middle_initial.capitalize
  end

  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :middle_initial, length:  {is: 1}, allow_blank: true
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
