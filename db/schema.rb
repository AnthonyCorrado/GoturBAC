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

ActiveRecord::Schema.define(version: 20140619224458) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "drinks", force: true do |t|
    t.string   "name"
    t.float    "alcohol"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendships", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_drinks", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "drink_id"
  end

  add_index "user_drinks", ["drink_id"], name: "index_user_drinks_on_drink_id", using: :btree
  add_index "user_drinks", ["user_id"], name: "index_user_drinks_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "gender"
    t.integer  "weight"
    t.float    "current_bac"
    t.float    "preferred_bac"
    t.integer  "venue_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.time     "drink_time"
  end

  add_index "users", ["venue_id"], name: "index_users_on_venue_id", using: :btree

  create_table "venues", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "venues", ["user_id"], name: "index_venues_on_user_id", using: :btree

end
