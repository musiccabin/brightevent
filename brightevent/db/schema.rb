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

ActiveRecord::Schema.define(version: 2019_08_10_190147) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.date "date"
    t.string "where"
    t.string "img_url"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "eventtaggings", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_eventtaggings_on_event_id"
    t.index ["tag_id"], name: "index_eventtaggings_on_tag_id"
  end

  create_table "rsvps", force: :cascade do |t|
    t.boolean "value"
    t.bigint "user_id"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_rsvps_on_event_id"
    t.index ["user_id"], name: "index_rsvps_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.string "img_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "usertaggings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_usertaggings_on_tag_id"
    t.index ["user_id"], name: "index_usertaggings_on_user_id"
  end

  add_foreign_key "events", "users"
  add_foreign_key "eventtaggings", "events"
  add_foreign_key "eventtaggings", "tags"
  add_foreign_key "rsvps", "events"
  add_foreign_key "rsvps", "users"
  add_foreign_key "usertaggings", "tags"
  add_foreign_key "usertaggings", "users"
end
