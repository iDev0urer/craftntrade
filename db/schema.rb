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

ActiveRecord::Schema.define(version: 20150620183959) do

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

  create_table "api_keys", force: :cascade do |t|
    t.integer  "user_id",         null: false
    t.string   "value",           null: false
    t.datetime "expiration_date"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "auctions", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title",          default: "",        null: false
    t.text     "details",        default: ""
    t.string   "listing_format", default: "auction", null: false
    t.boolean  "buy_now",        default: false,     null: false
    t.datetime "start_date",                         null: false
    t.datetime "end_date",                           null: false
    t.integer  "pick_up_only",                       null: false
    t.boolean  "free_shipping"
    t.integer  "weight"
    t.integer  "width"
    t.integer  "height"
    t.integer  "length"
    t.string   "paypal_email",                       null: false
    t.integer  "item_location",                      null: false
    t.json     "specifics"
    t.integer  "category_id"
  end

  add_index "auctions", ["user_id"], name: "index_auctions_on_user_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.integer  "auction_id"
    t.string   "title"
    t.integer  "parent_id"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "categories", ["auction_id"], name: "index_categories_on_auction_id", using: :btree

  create_table "currencies", force: :cascade do |t|
    t.string   "name"
    t.string   "symbol"
    t.float    "conversion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "auction_id"
    t.string   "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "firstname"
    t.string   "lastname"
    t.string   "encrypted_password",     default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "addresses", "users"
  add_foreign_key "auctions", "users"
  add_foreign_key "categories", "auctions"
end
