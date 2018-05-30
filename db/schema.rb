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

ActiveRecord::Schema.define(version: 2018_05_29_162831) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alert_scopes", force: :cascade do |t|
    t.bigint "alert_id"
    t.bigint "element_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alert_id"], name: "index_alert_scopes_on_alert_id"
    t.index ["element_id"], name: "index_alert_scopes_on_element_id"
  end

  create_table "alerts", force: :cascade do |t|
    t.date "date"
    t.string "category"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "elements", force: :cascade do |t|
    t.string "photo"
    t.bigint "zone_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity"
    t.string "name"
    t.index ["zone_id"], name: "index_elements_on_zone_id"
  end

  create_table "follows", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "garden_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["garden_id"], name: "index_follows_on_garden_id"
    t.index ["user_id"], name: "index_follows_on_user_id"
  end

  create_table "gardens", force: :cascade do |t|
    t.string "location"
    t.integer "area"
    t.string "photo"
    t.float "lat"
    t.float "long"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "log_scopes", force: :cascade do |t|
    t.bigint "log_id"
    t.bigint "element_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["element_id"], name: "index_log_scopes_on_element_id"
    t.index ["log_id"], name: "index_log_scopes_on_log_id"
  end

  create_table "logs", force: :cascade do |t|
    t.boolean "status"
    t.date "date"
    t.string "description"
    t.bigint "user_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category"
    t.index ["user_id"], name: "index_logs_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "element_id"
    t.integer "price"
    t.string "description"
    t.integer "quantity"
    t.string "photo"
    t.date "start_date"
    t.integer "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["element_id"], name: "index_products_on_element_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "avatar"
    t.bigint "garden_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["garden_id"], name: "index_users_on_garden_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "zones", force: :cascade do |t|
    t.string "name"
    t.integer "area"
    t.string "photo"
    t.bigint "garden_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["garden_id"], name: "index_zones_on_garden_id"
  end

  add_foreign_key "alert_scopes", "alerts"
  add_foreign_key "alert_scopes", "elements"
  add_foreign_key "elements", "zones"
  add_foreign_key "follows", "gardens"
  add_foreign_key "follows", "users"
  add_foreign_key "log_scopes", "elements"
  add_foreign_key "log_scopes", "logs"
  add_foreign_key "logs", "users"
  add_foreign_key "products", "elements"
  add_foreign_key "users", "gardens"
  add_foreign_key "zones", "gardens"
end
