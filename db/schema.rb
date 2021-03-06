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

ActiveRecord::Schema.define(version: 2021_03_25_032859) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "airlines", force: :cascade do |t|
    t.string "name"
    t.integer "fleet_size"
    t.boolean "is_mainline_passenger"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "marinas", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "state"
    t.boolean "has_boat_ramp"
    t.integer "low_tide_depth"
    t.integer "high_tide_depth"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pilots", force: :cascade do |t|
    t.string "name"
    t.boolean "is_captain"
    t.integer "years_experience"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.bigint "airline_id"
    t.index ["airline_id"], name: "index_pilots_on_airline_id"
  end

  create_table "vessels", force: :cascade do |t|
    t.string "name"
    t.string "make"
    t.integer "length_overall"
    t.boolean "mast_up"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.bigint "marina_id"
    t.index ["marina_id"], name: "index_vessels_on_marina_id"
  end

  add_foreign_key "pilots", "airlines"
  add_foreign_key "vessels", "marinas"
end
