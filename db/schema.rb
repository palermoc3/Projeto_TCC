# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2023_11_14_180804) do
  create_table "abouts", force: :cascade do |t|
    t.text "about_text"
    t.integer "store_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_abouts_on_store_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "administrators", force: :cascade do |t|
    t.string "cnpj"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_administrators_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cellphones", force: :cascade do |t|
    t.string "number"
    t.boolean "kind"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_cellphones_on_user_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "ctps"
    t.float "salary_base"
    t.integer "hours"
    t.float "commission_percent"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_employees_on_user_id"
  end

  create_table "item_purchases", force: :cascade do |t|
    t.integer "quantity"
    t.integer "product_id", null: false
    t.integer "purchase_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_item_purchases_on_product_id"
    t.index ["purchase_id"], name: "index_item_purchases_on_purchase_id"
  end

  create_table "payrolls", force: :cascade do |t|
    t.date "date_of_payroll"
    t.float "commission"
    t.float "discount"
    t.float "salary"
    t.string "description"
    t.integer "employee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_payrolls_on_employee_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.float "weight"
    t.float "width"
    t.float "length"
    t.float "valueSell"
    t.float "valueBuy"
    t.float "depth"
    t.integer "quantity"
    t.text "description"
    t.integer "sub_category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sub_category_id"], name: "index_products_on_sub_category_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.float "price"
    t.boolean "paid"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_purchases_on_user_id"
  end

  create_table "stores", force: :cascade do |t|
    t.integer "kind"
    t.integer "theme"
    t.integer "payroll_day"
    t.integer "administrator_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["administrator_id"], name: "index_stores_on_administrator_id"
  end

  create_table "sub_categories", force: :cascade do |t|
    t.string "name"
    t.integer "quantity"
    t.integer "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_sub_categories_on_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "cpf"
    t.string "email"
    t.integer "role"
    t.string "state"
    t.string "cep"
    t.string "street"
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  add_foreign_key "abouts", "stores"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "administrators", "users"
  add_foreign_key "cellphones", "users"
  add_foreign_key "employees", "users"
  add_foreign_key "item_purchases", "products"
  add_foreign_key "item_purchases", "purchases"
  add_foreign_key "payrolls", "employees"
  add_foreign_key "products", "sub_categories"
  add_foreign_key "purchases", "users"
  add_foreign_key "stores", "administrators"
  add_foreign_key "sub_categories", "categories"
end
