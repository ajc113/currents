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

ActiveRecord::Schema.define(version: 20160429233526) do

  create_table "buzzs", force: :cascade do |t|
    t.text     "post"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "short_name"
    t.text     "long_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reports", force: :cascade do |t|
    t.datetime "date"
    t.string   "target_species"
    t.string   "general_location"
    t.integer  "catch_keepers"
    t.integer  "catch_total"
    t.text     "trip_summary"
    t.string   "primary_method"
    t.text     "tide"
    t.text     "weather"
    t.text     "wind"
    t.text     "spot"
    t.binary   "picture"
    t.text     "best_bait"
    t.text     "trip_description"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.text     "home_port"
    t.string   "boat_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
