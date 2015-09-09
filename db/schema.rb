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

ActiveRecord::Schema.define(version: 20150901201255) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "announcements", force: :cascade do |t|
    t.string   "title"
    t.text     "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clans", force: :cascade do |t|
    t.string   "mon_img"
    t.string   "desc"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.string   "author"
    t.integer  "announcement_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "user_id"
  end

  add_index "comments", ["announcement_id", "created_at"], name: "index_comments_on_announcement_id_and_created_at", using: :btree
  add_index "comments", ["announcement_id"], name: "index_comments_on_announcement_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "families", force: :cascade do |t|
    t.string   "mon_img"
    t.string   "desc"
    t.string   "name"
    t.string   "clan"
    t.string   "bonus"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.string   "school_desc"
    t.string   "bonus"
    t.string   "skills"
    t.string   "honor"
    t.string   "outfit"
    t.string   "school_class"
    t.string   "clan"
    t.string   "rank1_name"
    t.string   "rank1_desc"
    t.string   "rank2_name"
    t.string   "rank2_desc"
    t.string   "rank3_name"
    t.string   "rank3_desc"
    t.string   "rank4_name"
    t.string   "rank4_desc"
    t.string   "rank5_name"
    t.string   "rank5_desc"
    t.string   "affinity_deficiency"
    t.string   "spells"
    t.string   "special"
    t.string   "shugenja_tech_name"
    t.string   "shugenja_tech_desc"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "clan_name"
    t.string   "img_name"
    t.string   "monk_tech_name"
    t.string   "monk_tech_desc"
  end

  create_table "spells", force: :cascade do |t|
    t.string   "zywiol"
    t.string   "krag"
    t.string   "nazwa"
    t.string   "img_name"
    t.string   "obszar"
    t.string   "zasieg"
    t.string   "opis"
    t.string   "podbicia"
    t.string   "specjalne"
    t.text     "tagi",       default: [],              array: true
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "czas"
  end

  create_table "traits", force: :cascade do |t|
    t.string   "kind"
    t.string   "name"
    t.string   "name_pl"
    t.string   "sphere"
    t.string   "desc"
    t.text     "value",      default: [],              array: true
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.boolean  "admin",                  default: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "comments", "announcements"
  add_foreign_key "comments", "users"
end
