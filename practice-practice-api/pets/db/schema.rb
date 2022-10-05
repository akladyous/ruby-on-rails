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

ActiveRecord::Schema.define(version: 2022_01_22_221413) do

  create_table "founds", force: :cascade do |t|
    t.datetime "date", precision: 6
    t.text "description"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "listing_founds", id: false, force: :cascade do |t|
    t.integer "listing_id", null: false
    t.integer "found_id", null: false
    t.index ["found_id"], name: "index_listing_founds_on_found_id"
    t.index ["listing_id"], name: "index_listing_founds_on_listing_id"
  end

  create_table "listing_losts", id: false, force: :cascade do |t|
    t.integer "listing_id", null: false
    t.integer "lost_id", null: false
    t.index ["listing_id"], name: "index_listing_losts_on_listing_id"
    t.index ["lost_id"], name: "index_listing_losts_on_lost_id"
  end

  create_table "listings", force: :cascade do |t|
    t.boolean "published"
    t.datetime "published_at", precision: 6
    t.integer "user_id", null: false
    t.integer "pet_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pet_id"], name: "index_listings_on_pet_id"
    t.index ["user_id"], name: "index_listings_on_user_id"
  end

  create_table "losts", force: :cascade do |t|
    t.datetime "date", precision: 6
    t.text "description"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.string "age"
    t.string "size"
    t.string "species"
    t.string "breed"
    t.string "gender"
    t.string "color"
    t.string "microchip"
    t.integer "height"
    t.integer "weight"
    t.string "coat_type"
    t.boolean "collar"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["user_name"], name: "index_users_on_user_name", unique: true
  end

  add_foreign_key "listing_founds", "founds"
  add_foreign_key "listing_founds", "listings"
  add_foreign_key "listing_losts", "listings"
  add_foreign_key "listing_losts", "losts"
  add_foreign_key "listings", "pets"
  add_foreign_key "listings", "users"
end
