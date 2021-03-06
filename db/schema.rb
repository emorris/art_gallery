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

ActiveRecord::Schema.define(version: 20160131004605) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "app_settings", force: :cascade do |t|
    t.integer  "singleton_guard"
    t.text     "about_text"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "artists", force: :cascade do |t|
    t.string   "name",       null: false
    t.text     "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "galleries", force: :cascade do |t|
    t.string   "name",                      null: false
    t.text     "text",                      null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "visible",    default: true
  end

  create_table "news_posts", force: :cascade do |t|
    t.string   "title",        null: false
    t.text     "text",         null: false
    t.date     "publish_date", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "pictures", force: :cascade do |t|
    t.string   "text"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "image_file"
    t.integer  "sort",           default: 0
  end

  add_index "pictures", ["imageable_type", "imageable_id"], name: "index_pictures_on_imageable_type_and_imageable_id", using: :btree

  create_table "shows", force: :cascade do |t|
    t.integer  "gallery_id"
    t.string   "title",           null: false
    t.text     "artists"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "visible"
    t.datetime "reception_start"
    t.datetime "reception_end"
    t.text     "text"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "shows", ["gallery_id"], name: "index_shows_on_gallery_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
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

end
