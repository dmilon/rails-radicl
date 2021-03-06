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

ActiveRecord::Schema.define(version: 2018_06_26_132609) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actions", force: :cascade do |t|
    t.boolean "status", default: false
    t.date "date"
    t.text "description"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category"
    t.bigint "element_id"
    t.index ["element_id"], name: "index_actions_on_element_id"
    t.index ["user_id"], name: "index_actions_on_user_id"
  end

  create_table "elements", force: :cascade do |t|
    t.string "photo"
    t.bigint "zone_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "area"
    t.index ["zone_id"], name: "index_elements_on_zone_id"
  end

  create_table "farms", force: :cascade do |t|
    t.integer "area"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.string "name"
  end

  create_table "follows", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "farm_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["farm_id"], name: "index_follows_on_farm_id"
    t.index ["user_id"], name: "index_follows_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.integer "price"
    t.text "description"
    t.integer "quantity"
    t.string "photo"
    t.date "start_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "end_date"
    t.bigint "farm_id"
    t.string "name"
    t.index ["farm_id"], name: "index_products_on_farm_id"
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
    t.bigint "farm_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["farm_id"], name: "index_users_on_farm_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "zones", force: :cascade do |t|
    t.string "name"
    t.integer "area"
    t.string "photo"
    t.bigint "farm_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["farm_id"], name: "index_zones_on_farm_id"
  end

  add_foreign_key "actions", "elements"
  add_foreign_key "actions", "users"
  add_foreign_key "elements", "zones"
  add_foreign_key "follows", "farms"
  add_foreign_key "follows", "users"
  add_foreign_key "products", "farms"
  add_foreign_key "users", "farms"
  add_foreign_key "zones", "farms"
end
