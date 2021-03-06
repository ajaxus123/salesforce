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

ActiveRecord::Schema.define(version: 20170219184539) do

  create_table "channels", force: :cascade do |t|
    t.string "name"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
  end

  create_table "stores", force: :cascade do |t|
    t.string   "storename"
    t.string   "address"
    t.string   "storecode"
    t.string   "phonenumber"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "user_id"
    t.integer  "channel_id"
    t.integer  "region_id"
    t.string   "hash_id"
    t.index ["channel_id"], name: "index_stores_on_channel_id"
    t.index ["region_id"], name: "index_stores_on_region_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "admin"
    t.boolean  "manager"
    t.boolean  "order_clerk"
    t.boolean  "return_clerk"
    t.string   "first_name"
    t.string   "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "visits", force: :cascade do |t|
    t.boolean  "order"
    t.boolean  "crm"
    t.boolean  "floorwalk"
    t.text     "comment"
    t.decimal  "order_value"
    t.string   "contact_person"
    t.integer  "store_id"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["store_id"], name: "index_visits_on_store_id"
    t.index ["user_id"], name: "index_visits_on_user_id"
  end

end
