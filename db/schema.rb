# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20190419233053) do

  create_table "answers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "question_id"
    t.string  "answer_text"
  end

  add_index "answers", ["user_id"], name: "index_answers_on_user_id"

  create_table "availabilities", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "available_at"
  end

  add_index "availabilities", ["user_id", "available_at"], name: "index_availabilities_on_user_id_and_available_at", unique: true
  add_index "availabilities", ["user_id"], name: "index_availabilities_on_user_id"

  create_table "questions", force: :cascade do |t|
    t.string "question_text"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.boolean  "admin",            default: false
    t.string   "phone_number"
    t.boolean  "is_expert",        default: false
    t.string   "university"
    t.boolean  "survey_completed", default: false
    t.string   "time_zone"
  end

end
