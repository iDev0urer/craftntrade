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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150609225624) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "addresses", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "line_one",     default: "",            null: false
    t.string   "line_two",     default: ""
    t.integer  "apartment"
    t.string   "city",                                 null: false
    t.string   "state",                                null: false
    t.integer  "zip",                                  null: false
    t.string   "address_type", default: "residential", null: false
    t.boolean  "default",      default: true,          null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "addresses", ["user_id"], name: "index_addresses_on_user_id", using: :btree

  create_table "auctions", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.hstore   "specifics"
    t.text     "details"
    t.string   "listing_format"
    t.boolean  "buy_now"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "added_date"
    t.datetime "ended_date"
    t.integer  "pick_up_only"
    t.boolean  "free_shipping"
    t.integer  "weight"
    t.integer  "width"
    t.integer  "height"
    t.integer  "length"
    t.string   "paypal_email"
    t.integer  "item_location"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",               default: "",    null: false
    t.string   "email",                  default: "",    null: false
    t.string   "first_name",             default: "",    null: false
    t.string   "middle_initial",         default: ""
    t.string   "last_name",              default: "",    null: false
    t.integer  "profile_pic_id",         default: 0
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "mailing_list",           default: false
    t.string   "gender"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "addresses", "users"
end
