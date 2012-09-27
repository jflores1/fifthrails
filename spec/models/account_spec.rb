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

require 'spec_helper'

describe Account do
  pending "add some examples to (or delete) #{__FILE__}"
end
