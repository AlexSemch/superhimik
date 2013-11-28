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

ActiveRecord::Schema.define(version: 20131128074713) do

  create_table "answers", force: true do |t|
    t.integer  "question_id"
    t.string   "content"
    t.boolean  "correct_answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "dimages", force: true do |t|
    t.string   "fotka_file_name"
    t.string   "fotka_content_type"
    t.integer  "fotka_file_size"
    t.datetime "fotka_updated_at"
    t.string   "flag"
    t.text     "descr"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jtests", force: true do |t|
    t.integer  "survey_id"
    t.integer  "user_id"
    t.float    "score"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nav_year"
  end

  create_table "questions", force: true do |t|
    t.integer  "survey_id"
    t.text     "content"
    t.integer  "number_of_answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", force: true do |t|
    t.string   "system_name"
    t.string   "nav_year"
    t.string   "footer"
    t.text     "about_as"
    t.text     "contact_as"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "settings", ["system_name"], name: "index_settings_on_system_name", unique: true, using: :btree

  create_table "surveys", force: true do |t|
    t.integer  "topic_id"
    t.string   "name"
    t.integer  "number_of_quesitons"
    t.integer  "time_to_complete"
    t.string   "test_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "theories", force: true do |t|
    t.integer  "topic_id"
    t.string   "name"
    t.text     "theory_text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "topics", force: true do |t|
    t.string   "content"
    t.integer  "grade"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "nik"
    t.string   "pip"
    t.string   "password_digest"
    t.boolean  "admin",               default: false
    t.integer  "grade"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["nik"], name: "index_users_on_nik", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
