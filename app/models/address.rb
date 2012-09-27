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
#

class Address < ActiveRecord::Base
  attr_accessible :account_id, :address_line_1, :address_line_2, :city, :state, :zip_code
end
