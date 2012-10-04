# == Schema Information
#
# Table name: accounts
#
#  id             :integer          not null, primary key
#  first_name     :string(255)
#  middle_initial :string(255)
#  last_name      :string(255)
#  home_phone     :string(255)
#  work_phone     :string(255)
#  cell_phone     :string(255)
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Account < ActiveRecord::Base
  attr_accessible :cell_phone, :first_name, :home_phone, :last_name, :middle_initial, :work_phone
  belongs_to :user
  has_many :addresses
  has_many :orders
  has_many :items

  #strip digits and return string of numbers
  before_save do |account|
    account.cell_phone = cell_phone.gsub(/\D/,'')
    account.home_phone = home_phone.gsub(/\D/,'')
    account.work_phone = work_phone.gsub(/\D/,'')
  end

  before_save do |account|
    account.first_name = first_name.capitalize
    account.last_name  = last_name.capitalize
    account.middle_initial = middle_initial.capitalize
  end

  validates :user_id, presence:true
  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :middle_initial, length:  {is: 1}, allow_blank: true
  validates :cell_phone, :home_phone, :work_phone, length: {in: 7..16}, allow_blank: true

end
