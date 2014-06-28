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

ActiveRecord::Schema.define(version: 20140627212720) do

  create_table "calendars", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "name"
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shifts", force: true do |t|
    t.datetime "week_number"
    t.string   "shift_name"
    t.integer  "user_id"
  end

  create_table "submited_hours", force: true do |t|
    t.time     "week_start_date"
    t.integer  "user_id"
    t.boolean  "Sunday_morning"
    t.boolean  "Sunday_evening"
    t.boolean  "Sunday_night"
    t.boolean  "Monday_morning"
    t.boolean  "Monday_evening"
    t.boolean  "Monday_night"
    t.boolean  "Tuesday_morning"
    t.boolean  "Tuesday_evening"
    t.boolean  "Tuesday_night"
    t.boolean  "Wednesday_morning"
    t.boolean  "Wednesday_evening"
    t.boolean  "Wednesday_night"
    t.boolean  "Thursday_morning"
    t.boolean  "Thursday_evening"
    t.boolean  "Thursday_night"
    t.boolean  "Friday_morning"
    t.boolean  "Friday_evening"
    t.boolean  "Friday_night"
    t.boolean  "Saturday_morning"
    t.boolean  "Saturday_evening"
    t.boolean  "Saturday_night"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "id_number"
    t.string   "position"
    t.string   "shabat"
    t.string   "admin"
    t.string   "l_name"
    t.string   "phone"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
