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

ActiveRecord::Schema.define(version: 20160728230642) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gnome_orders", force: :cascade do |t|
    t.integer "gnome_id"
    t.integer "order_id"
  end

  add_index "gnome_orders", ["gnome_id"], name: "index_gnome_orders_on_gnome_id", using: :btree
  add_index "gnome_orders", ["order_id"], name: "index_gnome_orders_on_order_id", using: :btree

  create_table "gnomes", force: :cascade do |t|
    t.string  "name"
    t.decimal "price"
    t.text    "desc"
    t.integer "category_id"
    t.string  "image_url"
  end

  add_index "gnomes", ["category_id"], name: "index_gnomes_on_category_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.decimal "total_price"
    t.integer "user_id"
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "gnome_orders", "gnomes"
  add_foreign_key "gnome_orders", "orders"
  add_foreign_key "gnomes", "categories"
  add_foreign_key "orders", "users"
end
