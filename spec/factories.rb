FactoryGirl.define do

  factory :user do
    email                   "jesse@test.com"
    password                "password"
    password_confirmation   "password"
    first_name              "Jesse"
    middle_initial          "A"
    last_name               "Flores"
    phone_number            "123-456-7895"
    admin                   false
  end

  factory :address do
    address_line_1  "4591 Derby Ln Se"
    address_line_2  ""
    city            "Smyrna"
    state           "GA"
    zip_code        "30082"
    account
    address_type    "Shipping"
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
    user
    order_amount    "25.00"
    address
    order_notes     "No notes"
    order_type      "Pickup"
    order_status    "Active"
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

  factory :quote do
    customer_type       "Residential"
    customer_need       "Storage"
    customer_location   30082
    customer_need_date  "2012-12-31"
    quote_email         "email@email.com"
    quote_phone_number  "555-555-5555"
  end


end