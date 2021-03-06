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

ActiveRecord::Schema.define(version: 20180329083242) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.bigint "surgery_id"
    t.string "description"
    t.string "flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["surgery_id"], name: "index_events_on_surgery_id"
  end

  create_table "form_answers", force: :cascade do |t|
    t.bigint "form_id"
    t.bigint "surgery_id"
    t.jsonb "answer_array"
    t.jsonb "webhook_answer"
    t.datetime "submit_date"
    t.index ["form_id"], name: "index_form_answers_on_form_id"
    t.index ["surgery_id"], name: "index_form_answers_on_surgery_id"
  end

  create_table "forms", force: :cascade do |t|
    t.bigint "surgery_type_id"
    t.string "pre_or_post"
    t.bigint "hospital_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "typeform_id"
    t.jsonb "question_array"
    t.index ["hospital_id"], name: "index_forms_on_hospital_id"
    t.index ["surgery_type_id"], name: "index_forms_on_surgery_type_id"
  end

  create_table "hospitals", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "photo"
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

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.bigint "searchable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id"
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
    t.text "pre_comments"
    t.text "post_comments"
    t.string "status"
    t.boolean "validated"
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
    t.string "last_name"
    t.string "first_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["hospital_id"], name: "index_users_on_hospital_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "visitors", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "events", "surgeries"
  add_foreign_key "form_answers", "forms"
  add_foreign_key "form_answers", "surgeries"
  add_foreign_key "forms", "hospitals"
  add_foreign_key "forms", "surgery_types"
  add_foreign_key "patients", "hospitals"
  add_foreign_key "surgeries", "patients"
  add_foreign_key "surgeries", "surgeons"
  add_foreign_key "surgeries", "surgery_types"
  add_foreign_key "users", "hospitals"
end
