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

ActiveRecord::Schema.define(version: 20140703175437) do

  create_table "assignments", force: true do |t|
    t.integer  "assigner_id"
    t.integer  "team_member_id_id"
    t.integer  "opportunity_id_id"
    t.integer  "role_id_id"
    t.float    "rate"
    t.float    "hours"
    t.integer  "start_week"
    t.integer  "start_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "opportunities", force: true do |t|
    t.integer  "client_id"
    t.integer  "xd_owner"
    t.string   "name"
    t.decimal  "xd_revenue",        precision: 12, scale: 2
    t.date     "proposed_date"
    t.date     "rfi_due_date"
    t.date     "rfp_due_date"
    t.date     "sow_due_date"
    t.date     "sse_due_date"
    t.date     "close_date"
    t.date     "start_date"
    t.date     "present_date"
    t.integer  "duration_in_weeks"
    t.boolean  "proposed_date_set",                          default: false
    t.boolean  "active",                                     default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "practices", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.decimal  "standard_rate", precision: 7, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "team_members", force: true do |t|
    t.integer  "practice_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
