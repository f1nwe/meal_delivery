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

ActiveRecord::Schema.define(version: 20180117182108) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "daily_order_meals", force: :cascade do |t|
    t.bigint "daily_order_id"
    t.bigint "meal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["daily_order_id"], name: "index_daily_order_meals_on_daily_order_id"
    t.index ["meal_id"], name: "index_daily_order_meals_on_meal_id"
  end

  create_table "daily_orders", force: :cascade do |t|
    t.bigint "user_id"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "menu_id"
    t.integer "total_cost_kopiykas", default: 0
    t.index ["date"], name: "index_daily_orders_on_date"
    t.index ["menu_id"], name: "index_daily_orders_on_menu_id"
    t.index ["user_id"], name: "index_daily_orders_on_user_id"
  end

  create_table "meal_categories", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meals", force: :cascade do |t|
    t.string "name"
    t.string "photo"
    t.bigint "menu_id"
    t.integer "price_kopiykas", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "meal_category_id"
    t.index ["meal_category_id"], name: "index_meals_on_meal_category_id"
    t.index ["menu_id"], name: "index_meals_on_menu_id"
  end

  create_table "menus", force: :cascade do |t|
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["date"], name: "index_menus_on_date"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "name", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.integer "role", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "daily_order_meals", "daily_orders"
  add_foreign_key "daily_order_meals", "meals"
  add_foreign_key "daily_orders", "menus"
  add_foreign_key "daily_orders", "users"
  add_foreign_key "meals", "meal_categories"
end
