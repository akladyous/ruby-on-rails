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

ActiveRecord::Schema[7.0].define(version: 2022_07_24_172224) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.datetime "clocked_in"
    t.datetime "clocked_out"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friends", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_friends_on_user_id"
  end

  create_table "mailing_lists", force: :cascade do |t|
    t.string "name"
    t.string "group"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mailing_lists_users", id: false, force: :cascade do |t|
    t.bigint "mailing_list_id", null: false
    t.bigint "user_id", null: false
    t.index ["mailing_list_id", "user_id"], name: "index_mailing_lists_users_on_mailing_list_id_and_user_id"
    t.index ["user_id", "mailing_list_id"], name: "index_mailing_lists_users_on_user_id_and_mailing_list_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "website"
    t.string "blog"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "resume"
    t.string "linked"
    t.bigint "user_id", null: false
    t.index ["linked"], name: "index_profiles_on_linked"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "supervisors", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_supervisors_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "age"
    t.string "phone"
    t.text "address"
    t.string "city"
    t.string "zip_code"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "status"
    t.integer "profiles_count", default: 0
    t.integer "padre_id"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["padre_id"], name: "index_users_on_padre_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "friends", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "supervisors", "users"
end