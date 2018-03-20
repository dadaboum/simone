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


ActiveRecord::Schema.define(version: 20180320133037) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alert_raisers", force: :cascade do |t|
    t.integer "alert_type"
    t.bigint "question_id"
    t.string "field_to_check"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_alert_raisers_on_question_id"
  end

  create_table "answer_types", force: :cascade do |t|
    t.string "description"
    t.boolean "has_photo"
    t.boolean "accept_multiple_answers"
    t.boolean "is_mandatory"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.bigint "surgeries_id"
    t.string "description"
    t.string "flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["surgeries_id"], name: "index_events_on_surgeries_id"
  end

  create_table "forms", force: :cascade do |t|
    t.bigint "surgery_type_id"
    t.string "pre_or_post"
    t.bigint "hospital_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "typeform_id"
    t.index ["hospital_id"], name: "index_forms_on_hospital_id"
    t.index ["surgery_type_id"], name: "index_forms_on_surgery_type_id"
  end

  create_table "hospitals", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "patient_answers", force: :cascade do |t|
    t.string "content"
    t.bigint "question_id"
    t.bigint "surgery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_patient_answers_on_question_id"
    t.index ["surgery_id"], name: "index_patient_answers_on_surgery_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.bigint "hospital_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hospital_id"], name: "index_patients_on_hospital_id"
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "form_id"
    t.string "content"
    t.bigint "answer_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_type_id"], name: "index_questions_on_answer_type_id"
    t.index ["form_id"], name: "index_questions_on_form_id"
  end

  create_table "suggested_answers", force: :cascade do |t|
    t.string "content"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_suggested_answers_on_question_id"
  end

  create_table "surgeons", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "surgeries", force: :cascade do |t|
    t.integer "encrypted_id"
    t.bigint "patient_id"
    t.bigint "surgery_type_id"
    t.boolean "is_done"
    t.date "date"
    t.bigint "surgeon_id"
    t.boolean "pre_form_answered", default: false
    t.boolean "post_form_answered", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "pre_form_id"
    t.integer "post_form_id"
    t.index ["patient_id"], name: "index_surgeries_on_patient_id"
    t.index ["surgeon_id"], name: "index_surgeries_on_surgeon_id"
    t.index ["surgery_type_id"], name: "index_surgeries_on_surgery_type_id"
  end

  create_table "surgery_types", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "hospital_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["hospital_id"], name: "index_users_on_hospital_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "alert_raisers", "questions"
  add_foreign_key "events", "surgeries", column: "surgeries_id"
  add_foreign_key "forms", "hospitals"
  add_foreign_key "forms", "surgery_types"
  add_foreign_key "patient_answers", "questions"
  add_foreign_key "patient_answers", "surgeries"
  add_foreign_key "patients", "hospitals"
  add_foreign_key "questions", "answer_types"
  add_foreign_key "questions", "forms"
  add_foreign_key "suggested_answers", "questions"
  add_foreign_key "surgeries", "patients"
  add_foreign_key "surgeries", "surgeons"
  add_foreign_key "surgeries", "surgery_types"
  add_foreign_key "users", "hospitals"
end
