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

ActiveRecord::Schema.define(version: 2019_10_25_194840) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: :cascade do |t|
    t.string "name"
    t.integer "priority"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "slider", default: false
    t.boolean "visible", default: false
    t.index ["name"], name: "index_albums_on_name", unique: true
  end

  create_table "contacts", force: :cascade do |t|
    t.string "service"
    t.string "login"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service"], name: "index_contacts_on_service", unique: true
  end

  create_table "images", force: :cascade do |t|
    t.string "file"
    t.integer "priority"
    t.bigint "album_id"
    t.index ["album_id"], name: "index_images_on_album_id"
  end

  create_table "settings", force: :cascade do |t|
    t.string "option"
    t.jsonb "value"
    t.index ["option"], name: "index_settings_on_option", unique: true
  end

  create_table "texts", force: :cascade do |t|
    t.string "key"
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_texts_on_title", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
