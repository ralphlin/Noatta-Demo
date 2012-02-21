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

ActiveRecord::Schema.define(:version => 20120220211255) do

  create_table "mb_online_add_arrivals", :force => true do |t|
    t.string   "status"
    t.string   "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "microposts", :force => true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "microposts", ["user_id", "created_at"], :name => "index_microposts_on_user_id_and_created_at"

  create_table "relationships", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], :name => "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], :name => "index_relationships_on_follower_id_and_followed_id", :unique => true
  add_index "relationships", ["follower_id"], :name => "index_relationships_on_follower_id"

  create_table "transactions", :force => true do |t|
    t.string   "business_name"
    t.decimal  "amount"
    t.string   "item_list"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "transactions", ["user_id", "created_at"], :name => "index_transactions_on_user_id_and_created_at"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
    t.boolean  "admin",                 :default => false
    t.string   "street_address"
    t.string   "city_address"
    t.string   "state_address"
    t.string   "zip_code"
    t.string   "phone_number"
    t.string   "business1_name"
    t.string   "business1_member_type"
    t.string   "business1_id"
    t.string   "business2_name"
    t.string   "business2_member_type"
    t.string   "business2_id"
    t.string   "business3_name"
    t.string   "business3_member_type"
    t.string   "business3_id"
    t.string   "business4_name"
    t.string   "business4_member_type"
    t.string   "business4_id"
    t.string   "bank1_name"
    t.string   "bank1_routing_number"
    t.string   "bank1_account_number"
    t.boolean  "bank1_isDefault"
    t.string   "bank2_name"
    t.string   "bank2_routing_number"
    t.string   "bank2_account_number"
    t.boolean  "bank2_isDefault"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
