# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_15_080915) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "realtors", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "date_of_birth"
    t.string "email"
    t.string "phone"
    t.float "ratings", default: 0.0
    t.integer "number_of_deals_completed", default: 0
    t.integer "number_of_deals_taken", default: 0
    t.boolean "marked_as_deleted", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_realtors_on_email", unique: true
  end

  create_table "sellers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "date_of_birth"
    t.string "email"
    t.string "phone"
    t.integer "number_of_listing", default: 0
    t.boolean "marked_as_deleted", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_sellers_on_email", unique: true
  end

  create_table "surveys", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.float "score"
    t.string "touchpoint"
    t.string "respondentable_type", null: false
    t.uuid "respondentable_id", null: false
    t.string "requesterable_type", null: false
    t.uuid "requesterable_id", null: false
    t.string "aasm_state"
    t.boolean "marked_as_deleted", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["requesterable_type", "requesterable_id"], name: "index_surveys_on_requesterable_type_and_requesterable_id"
    t.index ["respondentable_type", "respondentable_id"], name: "index_surveys_on_respondentable_type_and_respondentable_id"
  end

end
