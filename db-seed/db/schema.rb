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

ActiveRecord::Schema[7.0].define(version: 2022_06_23_053655) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string "comment"
    t.bigint "users_id", null: false
    t.bigint "image_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["image_id"], name: "index_comments_on_image_id"
    t.index ["users_id"], name: "index_comments_on_users_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "url"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_images_on_user_id"
  end

  create_table "user_addresses", force: :cascade do |t|
    t.string "address", limit: 50
    t.string "city", limit: 30
    t.string "zip_code"
    t.string "state", limit: 30
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_addresses_on_user_id"
  end

  create_table "user_profiles", force: :cascade do |t|
    t.string "first_name", limit: 50
    t.string "last_name", limit: 50
    t.string "phone", limit: 10
    t.string "title", limit: 25
    t.string "company", limit: 25
    t.string "website", limit: 100
    t.string "blog", limit: 100
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", limit: 50
    t.string "password", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "images"
  add_foreign_key "comments", "users", column: "users_id"
  add_foreign_key "images", "users"
  add_foreign_key "user_addresses", "users"
  add_foreign_key "user_profiles", "users"
end
