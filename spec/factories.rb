FactoryGirl.define do

  factory :user do
    email_address   "jesse@test.com"
    password        "password"
    password_confirmation "password"
  end

  factory :account do
    first_name      "Jesse"
    middle_initial  "A"
    last_name       "Flores"
    home_phone      "123-456-7895"
    work_phone      "123-565-7980"
    cell_phone      "234-567-7890"
    user
  end


end