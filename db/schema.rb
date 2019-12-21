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

ActiveRecord::Schema.define(version: 2018_05_04_013345) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", id: :serial, force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_id", null: false
    t.string "resource_type", null: false
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "buzzs", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "post"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_buzzs_on_user_id"
  end

  create_table "ckeditor_assets", id: :serial, force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "type", limit: 30
    t.integer "width"
    t.integer "height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "comments", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "body"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
  end

  create_table "delayed_jobs", id: :serial, force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "friendly_id_slugs", id: :serial, force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "hotspots", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "commentary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
  end

  create_table "intels", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
  end

  create_table "locations", id: :serial, force: :cascade do |t|
    t.string "short_name"
    t.text "long_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "coordinates"
    t.string "coordinate_file"
    t.text "demographic"
    t.integer "number"
    t.string "state_waters"
  end

  create_table "posts", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "youtube_id"
    t.string "slug"
    t.string "image"
    t.text "meta_title"
    t.text "meta_description"
    t.text "meta_keywords"
    t.index ["slug"], name: "index_posts_on_slug", unique: true
  end

  create_table "reports", id: :serial, force: :cascade do |t|
    t.float "catch_keepers", null: false
    t.integer "catch_total"
    t.text "trip_summary"
    t.string "primary_method"
    t.text "tide"
    t.text "weather"
    t.text "wind"
    t.text "spot"
    t.text "best_bait"
    t.text "trip_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.integer "location_id", null: false
    t.integer "user_id"
    t.date "date", null: false
    t.integer "species_id", null: false
    t.string "state_waters"
    t.index ["location_id"], name: "index_reports_on_location_id"
    t.index ["user_id"], name: "index_reports_on_user_id"
  end

  create_table "species", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "state_waters"
    t.string "located"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spots", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.text "meta_title"
    t.text "meta_description"
    t.text "meta_keywords"
  end

  create_table "states", id: false, force: :cascade do |t|
    t.string "name", null: false
    t.float "lat"
    t.float "lng"
    t.boolean "visible", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "zoom", default: 9
    t.index ["name"], name: "index_states_on_name", unique: true
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "home_port"
    t.string "state_waters"
    t.string "vessel_name"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "subscription_tier"
    t.string "stripe_customer_id", default: "", null: false
    t.string "subscription_id"
    t.boolean "is_active", default: true, null: false
    t.string "payment_source"
    t.datetime "deleted_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "buzzs", "users"
  add_foreign_key "comments", "posts"
  add_foreign_key "locations", "states", column: "state_waters", primary_key: "name"
  add_foreign_key "reports", "locations"
  add_foreign_key "reports", "states", column: "state_waters", primary_key: "name"
  add_foreign_key "reports", "users"
  add_foreign_key "users", "states", column: "state_waters", primary_key: "name"
end
