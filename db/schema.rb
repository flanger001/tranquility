# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_13_193235) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "url"
    t.boolean "inline", default: false, null: false
    t.integer "products_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category_collection_id"
    t.string "seo"
    t.string "photo"
    t.boolean "active", default: false
    t.integer "position"
    t.index ["url"], name: "index_categories_on_url"
  end

  create_table "category_collections", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "seo"
    t.boolean "inline", default: false
    t.boolean "active", default: false
    t.integer "position"
    t.index ["url"], name: "index_category_collections_on_url"
  end

  create_table "events", id: :serial, force: :cascade do |t|
    t.time "start_time"
    t.time "end_time"
    t.string "day"
    t.boolean "off"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "schedule_id"
  end

  create_table "product_attributes", id: :serial, force: :cascade do |t|
    t.integer "product_id"
    t.integer "time"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_attributes_on_product_id"
  end

  create_table "products", id: :serial, force: :cascade do |t|
    t.integer "category_id"
    t.string "name"
    t.string "url"
    t.string "description"
    t.integer "price"
    t.integer "reviews_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "seo"
    t.string "photo"
    t.boolean "active", default: false
    t.integer "position"
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["url"], name: "index_products_on_url"
  end

  create_table "recommendations", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "url"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", id: :serial, force: :cascade do |t|
    t.integer "product_id"
    t.boolean "active", default: false
    t.string "title"
    t.string "customer_name"
    t.text "body"
    t.integer "rating", limit: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "show_customer_name"
    t.datetime "date"
    t.index ["product_id"], name: "index_reviews_on_product_id"
  end

  create_table "schedules", id: :serial, force: :cascade do |t|
    t.integer "staff_id"
    t.text "notes"
    t.integer "events_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["staff_id"], name: "index_schedules_on_staff_id"
  end

  create_table "snippet_collections", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.text "description"
    t.integer "category_collection_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "snippets", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.text "body"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: false
    t.integer "snippet_collection_id"
  end

  create_table "staff", id: :serial, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "credentials"
    t.string "photo"
    t.text "title"
    t.text "bio"
    t.text "services"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "url"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "categories", "category_collections"
  add_foreign_key "events", "schedules"
  add_foreign_key "product_attributes", "products"
  add_foreign_key "products", "categories"
  add_foreign_key "reviews", "products"
  add_foreign_key "schedules", "staff"
  add_foreign_key "snippet_collections", "category_collections"
  add_foreign_key "snippets", "snippet_collections"
end
