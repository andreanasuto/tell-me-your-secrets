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

ActiveRecord::Schema.define(version: 20190506184859) do

  create_table "locations", force: :cascade do |t|
    t.float "latitude"
    t.float "longitude"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "house_number"
    t.string "road"
    t.string "city"
    t.string "county"
    t.string "city_district"
    t.string "suburb"
    t.string "state"
    t.string "country"
    t.string "zipcode"
    t.integer "secret_id"
    t.index ["secret_id"], name: "index_locations_on_secret_id"
  end

  create_table "secrets", force: :cascade do |t|
    t.text "sentence"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "location_id"
    t.index ["location_id"], name: "index_secrets_on_location_id"
    t.index ["user_id"], name: "index_secrets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "auth_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "secret_id"
    t.string "uid"
    t.string "provider"
    t.index ["auth_token"], name: "index_users_on_auth_token", unique: true
    t.index ["secret_id"], name: "index_users_on_secret_id"
  end

end
