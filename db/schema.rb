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

ActiveRecord::Schema.define(version: 20140423234252) do

  create_table "bids", force: true do |t|
    t.text     "description"
    t.decimal  "price",       precision: 8, scale: 0
    t.string   "image_url"
    t.integer  "user_id"
    t.integer  "job_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bids", ["job_id"], name: "index_bids_on_job_id"
  add_index "bids", ["user_id"], name: "index_bids_on_user_id"

  create_table "categories", force: true do |t|
    t.string   "title"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lft"
    t.integer  "rgt"
    t.string   "font"
  end

  add_index "categories", ["parent_id"], name: "index_categories_on_parent_id"

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority"

  create_table "documents", force: true do |t|
    t.integer  "user_id",                             null: false
    t.string   "direct_upload_url",                   null: false
    t.string   "upload_file_name"
    t.string   "upload_content_type"
    t.integer  "upload_file_size"
    t.datetime "upload_updated_at"
    t.boolean  "processed",           default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "job_id"
  end

  add_index "documents", ["job_id"], name: "index_documents_on_job_id"
  add_index "documents", ["user_id"], name: "index_documents_on_user_id"

  create_table "jobs", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image_url"
    t.integer  "category_id"
    t.boolean  "status"
    t.datetime "from"
    t.datetime "to"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "jobs", ["category_id"], name: "index_jobs_on_category_id"
  add_index "jobs", ["user_id"], name: "index_jobs_on_user_id"

  create_table "questions", force: true do |t|
    t.text     "inquiry"
    t.text     "answer"
    t.string   "image_url"
    t.integer  "user_id"
    t.integer  "job_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["job_id"], name: "index_questions_on_job_id"
  add_index "questions", ["user_id"], name: "index_questions_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.string   "email"
    t.string   "avatar_url"
    t.string   "phone"
    t.boolean  "bidder"
    t.text     "info"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "access"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

end
