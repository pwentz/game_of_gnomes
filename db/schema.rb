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

ActiveRecord::Schema.define(version: 20160803162238) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gnomes", force: :cascade do |t|
    t.string  "name"
    t.decimal "price"
    t.text    "desc"
    t.integer "category_id"
    t.string  "image_url"
    t.integer "role"
  end

  add_index "gnomes", ["category_id"], name: "index_gnomes_on_category_id", using: :btree

  create_table "order_gnomes", force: :cascade do |t|
    t.integer "gnome_id"
    t.integer "order_id"
    t.integer "quantity"
    t.decimal "subtotal"
  end

  add_index "order_gnomes", ["gnome_id"], name: "index_order_gnomes_on_gnome_id", using: :btree
  add_index "order_gnomes", ["order_id"], name: "index_order_gnomes_on_order_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.decimal  "total_price"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status",      default: 0
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "role",               default: 0
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "email"
    t.string   "country_code"
    t.string   "phone_number"
    t.string   "authy_id"
    t.string   "verified",           default: "f"
  end

  add_foreign_key "gnomes", "categories"
  add_foreign_key "order_gnomes", "gnomes"
  add_foreign_key "order_gnomes", "orders"
  add_foreign_key "orders", "users"
end
