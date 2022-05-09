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

ActiveRecord::Schema[7.0].define(version: 2022_05_09_145437) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hotel_rooms", force: :cascade do |t|
    t.string "image"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "room_id", null: false
    t.bigint "hotel_id", null: false
    t.index ["hotel_id"], name: "index_hotel_rooms_on_hotel_id"
    t.index ["room_id"], name: "index_hotel_rooms_on_room_id"
  end

  create_table "hotels", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "rating"
    t.string "location"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_hotels_on_user_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "hotel_room_id", null: false
    t.date "date"
    t.index ["hotel_room_id"], name: "index_reservations_on_hotel_room_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "guests_number"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.boolean "admin", default: false
    t.string "profile_picture", default: "https://www.kindpng.com/picc/m/171-1712282_profile-icon-png-profile-icon-vector-png-transparent.png"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "hotel_rooms", "hotels"
  add_foreign_key "hotel_rooms", "rooms"
  add_foreign_key "hotels", "users"
  add_foreign_key "reservations", "hotel_rooms"
  add_foreign_key "reservations", "users"
end
