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

ActiveRecord::Schema.define(version: 2022_01_24_022036) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "stations", force: :cascade do |t|
    t.string "station_uid", null: false
    t.string "station_code", null: false
    t.jsonb "station_name", null: false
    t.integer "version", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stop_times", force: :cascade do |t|
    t.integer "stop_sequence"
    t.string "departure_time"
    t.string "arrival_time"
    t.bigint "train_id", null: false
    t.bigint "station_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["station_id"], name: "index_stop_times_on_station_id"
    t.index ["train_id"], name: "index_stop_times_on_train_id"
  end

  create_table "trains", force: :cascade do |t|
    t.string "train_no", null: false
    t.integer "service_day", null: false, array: true
    t.integer "direction", null: false
    t.bigint "version_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["version_id"], name: "index_trains_on_version_id"
  end

  create_table "versions", force: :cascade do |t|
    t.integer "version_no", null: false
    t.string "update_time"
    t.string "effective_date"
    t.string "expiring_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "stop_times", "stations"
  add_foreign_key "stop_times", "trains"
  add_foreign_key "trains", "versions"
end
