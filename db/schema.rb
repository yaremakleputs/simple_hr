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

ActiveRecord::Schema.define(version: 20180327032902) do

  create_table "employee_posts", force: :cascade do |t|
    t.integer  "employee_id"
    t.integer  "post_id"
    t.boolean  "seen",        default: false, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["employee_id"], name: "index_employee_posts_on_employee_id"
    t.index ["post_id"], name: "index_employee_posts_on_post_id"
  end

  create_table "employees_groups", force: :cascade do |t|
    t.integer "employee_id"
    t.integer "group_id"
    t.index ["employee_id"], name: "index_employees_groups_on_employee_id"
    t.index ["group_id"], name: "index_employees_groups_on_group_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.integer  "admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_posts_on_admin_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",              default: "", null: false
    t.string   "encrypted_password", default: "", null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "type"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
