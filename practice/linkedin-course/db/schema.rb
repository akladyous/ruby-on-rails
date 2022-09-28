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

ActiveRecord::Schema[7.0].define(version: 2022_06_01_151305) do
  create_table "books", force: :cascade do |t|
    t.string "title"
    t.integer "pages"
    t.string "author"
    t.string "category"
    t.decimal "price", precision: 5, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "products_count", default: 0
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.date "founded_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: true
  end

  create_table "countries_names", id: false, force: :cascade do |t|
    t.integer "name_id", null: false
    t.integer "country_id", null: false
    t.index ["country_id", "name_id"], name: "index_countries_names_on_country_id_and_name_id"
    t.index ["name_id", "country_id"], name: "index_countries_names_on_name_id_and_country_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "branch"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "supervisor_id"
    t.index ["supervisor_id"], name: "index_employees_on_supervisor_id"
  end

  create_table "names", force: :cascade do |t|
    t.string "first_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "last_name", limit: 50
    t.string "nick_name"
    t.text "prova", limit: 10
    t.decimal "contatore", precision: 5, scale: 2
    t.integer "qty", default: 0
    t.index ["first_name"], name: "by_first_name"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.integer "qty"
    t.boolean "sold"
    t.integer "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "color"
    t.integer "status", limit: 2, default: 0
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.integer "company_id", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "email"
    t.boolean "active", default: true
    t.integer "role", limit: 2, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email", "company_id", "username"], name: "index_users_on_email_and_company_id_and_username", unique: true
  end

  add_foreign_key "products", "categories"
  add_foreign_key "users", "companies"
end
