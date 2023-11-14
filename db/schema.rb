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

ActiveRecord::Schema[7.1].define(version: 2023_11_14_142136) do
  create_table "administrators", force: :cascade do |t|
    t.string "cnpj"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_administrators_on_user_id"
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

  add_foreign_key "administrators", "users"
  add_foreign_key "cellphones", "users"
  add_foreign_key "employees", "users"
end
