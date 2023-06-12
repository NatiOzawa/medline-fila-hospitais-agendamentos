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

ActiveRecord::Schema[7.0].define(version: 2023_06_12_154040) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.integer "doctor_id"
    t.bigint "user_id", null: false
    t.bigint "clinic_id", null: false
    t.datetime "time"
    t.string "status"
    t.boolean "emergency", default: false
    t.integer "date_position"
    t.jsonb "screening", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "body_area", default: [], array: true
    t.integer "pain_scale"
    t.text "additional_information"
    t.index ["clinic_id"], name: "index_appointments_on_clinic_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "clinics", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone"
    t.float "long"
    t.float "lat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "doctors", force: :cascade do |t|
    t.string "name"
    t.string "specialty"
    t.string "crm"
    t.bigint "clinic_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clinic_id"], name: "index_doctors_on_clinic_id"
  end

  create_table "users", force: :cascade do |t|
    t.date "date_of_birth"
    t.string "address"
    t.string "phone"
    t.string "health_insurance"
    t.float "long"
    t.float "lat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "appointments", "clinics"
  add_foreign_key "appointments", "users"
  add_foreign_key "doctors", "clinics"
end
