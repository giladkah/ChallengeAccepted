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

ActiveRecord::Schema.define(version: 20170117060649) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "day_parts", force: :cascade do |t|
    t.integer  "location_id"
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.integer  "brand_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "locations", ["brand_id"], name: "index_locations_on_brand_id", using: :btree

  create_table "menu_items", force: :cascade do |t|
    t.integer  "brand_id"
    t.string   "name"
    t.integer  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string   "message_id"
    t.string   "timestamp"
    t.string   "actor"
    t.string   "number"
    t.string   "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "order_types", force: :cascade do |t|
    t.integer  "brand_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string   "price_level"
    t.integer  "price"
    t.integer  "menu_item_id"
    t.integer  "order_type_id"
    t.integer  "day_part_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "orders", ["day_part_id"], name: "index_orders_on_day_part_id", using: :btree
  add_index "orders", ["menu_item_id"], name: "index_orders_on_menu_item_id", using: :btree
  add_index "orders", ["order_type_id"], name: "index_orders_on_order_type_id", using: :btree

  create_table "price_configurations", force: :cascade do |t|
    t.string   "order_type"
    t.string   "day_part"
    t.string   "price_level"
    t.integer  "location_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "price_configurations", ["location_id"], name: "index_price_configurations_on_location_id", using: :btree

  create_table "price_levels", force: :cascade do |t|
    t.integer  "brand_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone_number"
    t.string   "address"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "uuid"
  end

  create_table "widgets", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "stock"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "day_parts", "locations"
  add_foreign_key "locations", "brands"
  add_foreign_key "menu_items", "brands"
  add_foreign_key "messages", "users"
  add_foreign_key "order_types", "brands"
  add_foreign_key "orders", "day_parts"
  add_foreign_key "orders", "menu_items"
  add_foreign_key "orders", "order_types"
  add_foreign_key "price_configurations", "locations"
  add_foreign_key "price_levels", "brands"
end
