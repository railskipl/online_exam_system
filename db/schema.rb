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

ActiveRecord::Schema.define(version: 20150422074637) do

  create_table "adminsections", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "adminsections", ["email"], name: "index_adminsections_on_email", unique: true
  add_index "adminsections", ["reset_password_token"], name: "index_adminsections_on_reset_password_token", unique: true

  create_table "answers", force: :cascade do |t|
    t.integer  "question_id"
    t.string   "content"
    t.boolean  "correct_answer"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "exams", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "timing"
    t.datetime "starttime"
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "exam_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "results", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "answer_id"
    t.integer  "userchoice_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "exam_id"
  end

  create_table "userchoices", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "exam_id"
    t.integer  "question_id"
    t.integer  "answer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.date     "dob"
    t.decimal  "contact"
    t.string   "address"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "exam_id"
    t.integer  "no_of_correct_answer"
    t.integer  "percent"
  end

end
