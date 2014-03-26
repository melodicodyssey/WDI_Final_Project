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

ActiveRecord::Schema.define(version: 20140325234705) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.integer  "log_id"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["log_id"], name: "index_comments_on_log_id", using: :btree

  create_table "connections", force: true do |t|
    t.integer  "user_id"
    t.integer  "contact_id"
    t.integer  "first_name_id"
    t.integer  "last_name_id"
    t.integer  "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "connections", ["contact_id"], name: "index_connections_on_contact_id", using: :btree
  add_index "connections", ["first_name_id"], name: "index_connections_on_first_name_id", using: :btree
  add_index "connections", ["last_name_id"], name: "index_connections_on_last_name_id", using: :btree
  add_index "connections", ["user_id"], name: "index_connections_on_user_id", using: :btree

  create_table "contacts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "first_names", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "last_names", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "linkedins", force: true do |t|
    t.integer  "user_id"
    t.integer  "contact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "linkedins", ["contact_id"], name: "index_linkedins_on_contact_id", using: :btree
  add_index "linkedins", ["user_id"], name: "index_linkedins_on_user_id", using: :btree

  create_table "logs", force: true do |t|
    t.integer  "connection_id"
    t.date     "timestamp"
    t.string   "source"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "logs", ["connection_id"], name: "index_logs_on_connection_id", using: :btree

  create_table "users", force: true do |t|
    t.integer  "first_name_id"
    t.integer  "last_name_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "access_token"
    t.integer  "expires_at"
  end

  add_index "users", ["first_name_id"], name: "index_users_on_first_name_id", using: :btree
  add_index "users", ["last_name_id"], name: "index_users_on_last_name_id", using: :btree

end
