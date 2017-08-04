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

ActiveRecord::Schema.define(version: 20170804123545) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
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
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "buzzs", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "post"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "buzzs", ["user_id"], name: "index_buzzs_on_user_id", using: :btree

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "short_name"
    t.text     "long_name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "coordinates"
    t.string   "coordinate_file"
    t.text     "demographic"
    t.integer  "number"
    t.string   "state_waters"
  end

  create_table "reports", force: :cascade do |t|
    t.float    "catch_keepers",    null: false
    t.integer  "catch_total"
    t.text     "trip_summary"
    t.string   "primary_method"
    t.text     "tide"
    t.text     "weather"
    t.text     "wind"
    t.text     "spot"
    t.text     "best_bait"
    t.text     "trip_description"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "location_id",      null: false
    t.integer  "user_id"
    t.date     "date",             null: false
    t.integer  "species_id",       null: false
    t.string   "state_waters"
  end

  add_index "reports", ["location_id"], name: "index_reports_on_location_id", using: :btree
  add_index "reports", ["user_id"], name: "index_reports_on_user_id", using: :btree

  create_table "species", force: :cascade do |t|
    t.string   "name"
    t.string   "state_waters"
    t.string   "located"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "states", id: false, force: :cascade do |t|
    t.string   "name",                      null: false
    t.float    "lat"
    t.float    "lng"
    t.boolean  "visible",    default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "zoom",       default: 9
  end

  add_index "states", ["name"], name: "index_states_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "home_port"
    t.string   "state_waters"
    t.string   "vessel_name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "subscription_tier"
    t.string   "stripe_customer_id",     default: "",   null: false
    t.string   "subscription_id"
    t.boolean  "is_active",              default: true, null: false
    t.string   "payment_source"
    t.datetime "deleted_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "buzzs", "users"
  add_foreign_key "locations", "states", column: "state_waters", primary_key: "name"
  add_foreign_key "reports", "locations"
  add_foreign_key "reports", "states", column: "state_waters", primary_key: "name"
  add_foreign_key "reports", "users"
  add_foreign_key "users", "states", column: "state_waters", primary_key: "name"
end
