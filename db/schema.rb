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

ActiveRecord::Schema.define(version: 20150608190501) do

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "description"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "avatarFileName"
  end

  create_table "tasks", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "name"
    t.integer  "parent_id"
    t.string   "description"
    t.integer  "closed_by"
    t.integer  "assignee"
    t.datetime "created_at",  null: false
    t.datetime "closed_at"
    t.integer  "estimate"
    t.integer  "task_state"
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "tasks", ["user_id"], name: "index_tasks_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "firstName"
    t.string   "lastName"
    t.string   "email"
    t.string   "password_digest"
    t.string   "password_salt"
    t.string   "avatarFileName"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "remember_digest"
  end

  create_table "work_logs", force: :cascade do |t|
    t.integer  "task_id"
    t.integer  "user_id"
    t.integer  "value"
    t.text     "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "work_logs", ["task_id"], name: "index_work_logs_on_task_id"
  add_index "work_logs", ["user_id"], name: "index_work_logs_on_user_id"

end
