# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121031144328) do

  create_table "accounts", :force => true do |t|
    t.string   "first_name"
    t.string   "middle_initial"
    t.string   "last_name"
    t.string   "home_phone"
    t.string   "work_phone"
    t.string   "cell_phone"
    t.integer  "user_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "accounts", ["user_id"], :name => "user_id_ix"

  create_table "addresses", :force => true do |t|
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "city"
    t.string   "state"
    t.integer  "zip_code"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "address_type"
    t.integer  "user_id"
    t.integer  "order_id"
    t.string   "nickname"
  end

  add_index "addresses", ["user_id"], :name => "index_addresses_on_user_id"

  create_table "items", :force => true do |t|
    t.string   "name"
    t.string   "item_type"
    t.float    "price"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.float    "item_length"
    t.float    "item_width"
    t.float    "item_height"
    t.string   "item_status"
    t.text     "item_description"
    t.integer  "user_id"
  end

  add_index "items", ["user_id"], :name => "index_items_on_user_id"

  create_table "order_items", :force => true do |t|
    t.integer  "order_id"
    t.integer  "item_id"
    t.integer  "quantity"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "orders", :force => true do |t|
    t.float    "order_amount"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.text     "order_notes"
    t.string   "referral"
    t.integer  "user_id"
    t.integer  "address_id"
    t.string   "order_type"
    t.string   "order_status", :default => "Active"
    t.date     "order_date"
  end

  add_index "orders", ["user_id"], :name => "index_orders_on_user_id"

  create_table "quotes", :force => true do |t|
    t.string   "customer_type"
    t.string   "customer_need"
    t.integer  "customer_location"
    t.date     "customer_need_date"
    t.string   "quote_email"
    t.string   "quote_phone_number"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email_address"
    t.string   "password"
    t.string   "password_confirmation"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "first_name"
    t.string   "middle_initial"
    t.string   "last_name"
    t.string   "phone_number"
    t.boolean  "admin",                 :default => false
  end

  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
