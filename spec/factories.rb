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

  factory :order do
    order_date      "2012-12-31"
    account
    order_amount    "25.00"
    address
  end

  factory :item do
    name              "Test Item"
    item_type         "Customer"
    item_description  "Description"
    account
    item_length       "12.5"
    item_width        "12.5"
    item_height       "13.5"
    item_status       "Stored"
  end


end