# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_20_175353) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_histories", force: :cascade do |t|
    t.bigint "valera_id"
    t.bigint "valera_action_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["valera_action_id"], name: "index_action_histories_on_valera_action_id"
    t.index ["valera_id"], name: "index_action_histories_on_valera_id"
  end

  create_table "max_characteristics", force: :cascade do |t|
    t.bigint "valera_id"
    t.integer "health", default: 100
    t.integer "mana", default: 100
    t.integer "cheerfulness", default: 10
    t.integer "fatigue", default: 100
    t.integer "money", default: 100
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["valera_id"], name: "index_max_characteristics_on_valera_id", unique: true
  end

  create_table "metro_characteristics", force: :cascade do |t|
    t.bigint "valera_id"
    t.integer "tips", default: 50
    t.integer "min_mana", default: 40
    t.integer "max_mana", default: 70
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["valera_id"], name: "index_metro_characteristics_on_valera_id", unique: true
  end

  create_table "min_characteristics", force: :cascade do |t|
    t.bigint "valera_id"
    t.integer "health", default: 0
    t.integer "mana", default: 0
    t.integer "cheerfulness", default: -10
    t.integer "fatigue", default: 0
    t.integer "money", default: -500
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["valera_id"], name: "index_min_characteristics_on_valera_id", unique: true
  end

  create_table "sleep_characteristics", force: :cascade do |t|
    t.bigint "valera_id"
    t.integer "heal_mana", default: 30
    t.integer "cheerfulness_mana", default: 70
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["valera_id"], name: "index_sleep_characteristics_on_valera_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", null: false
    t.string "encrypted_password", limit: 128, null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  create_table "valera_actions", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "health"
    t.integer "mana"
    t.integer "cheerfulness"
    t.integer "fatigue"
    t.integer "money"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "valeras", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "health"
    t.integer "mana"
    t.integer "cheerfulness"
    t.integer "fatigue"
    t.integer "money"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_valeras_on_user_id", unique: true
  end

  create_table "work_characteristics", force: :cascade do |t|
    t.bigint "valera_id"
    t.integer "mana", default: 50
    t.integer "fatigue", default: 10
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["valera_id"], name: "index_work_characteristics_on_valera_id", unique: true
  end

  add_foreign_key "action_histories", "valera_actions"
  add_foreign_key "action_histories", "valeras"
  add_foreign_key "max_characteristics", "valeras"
  add_foreign_key "metro_characteristics", "valeras"
  add_foreign_key "min_characteristics", "valeras"
  add_foreign_key "sleep_characteristics", "valeras"
  add_foreign_key "valeras", "users"
  add_foreign_key "work_characteristics", "valeras"
end
