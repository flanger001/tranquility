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

ActiveRecord::Schema.define(version: 20150912001852) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "url"
    t.boolean  "inline",                 default: false, null: false
    t.integer  "products_count",         default: 0,     null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "category_collection_id"
    t.string   "seo"
    t.string   "photo"
  end

  create_table "category_collections", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "url"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "seo"
    t.boolean  "inline",      default: false
  end

  create_table "events", force: :cascade do |t|
    t.time     "start_time"
    t.time     "end_time"
    t.string   "day"
    t.boolean  "off"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "schedule_id"
  end

  create_table "product_attributes", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "time"
    t.integer  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "product_attributes", ["product_id"], name: "index_product_attributes_on_product_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.integer  "category_id"
    t.string   "name"
    t.string   "url"
    t.string   "description"
    t.integer  "price"
    t.integer  "reviews_count", default: 0, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "seo"
    t.string   "photo"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.integer  "product_id"
    t.boolean  "active",               default: false
    t.string   "title"
    t.string   "author"
    t.text     "body"
    t.integer  "rating",     limit: 2
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "reviews", ["product_id"], name: "index_reviews_on_product_id", using: :btree

  create_table "schedules", force: :cascade do |t|
    t.integer  "staff_id"
    t.text     "notes"
    t.integer  "events_count", default: 0, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "name"
  end

  add_index "schedules", ["staff_id"], name: "index_schedules_on_staff_id", using: :btree

  create_table "snippets", force: :cascade do |t|
    t.string   "name"
    t.string   "title"
    t.text     "body"
    t.integer  "category_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "active",      default: false
  end

  create_table "staff", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "credentials"
    t.string   "photo"
    t.text     "title"
    t.text     "bio"
    t.text     "services"
    t.text     "notes"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "admin"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "product_attributes", "products"
  add_foreign_key "products", "categories"
  add_foreign_key "reviews", "products"
  add_foreign_key "schedules", "staff"
end
