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

ActiveRecord::Schema[7.0].define(version: 2022_12_07_013143) do
  create_table "horarios", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "dia", null: false
    t.time "desde"
    t.time "hasta"
    t.bigint "sucursal_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sucursal_id", "dia"], name: "index_horarios_on_sucursal_id_and_dia", unique: true
    t.index ["sucursal_id"], name: "index_horarios_on_sucursal_id"
  end

  create_table "localities", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "province"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["province", "name"], name: "index_localities_on_province_and_name", unique: true
  end

  create_table "sucursales_horarios", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "sucursal_id", null: false
    t.bigint "horario_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["horario_id"], name: "index_sucursales_horarios_on_horario_id"
    t.index ["sucursal_id"], name: "index_sucursales_horarios_on_sucursal_id"
  end

  create_table "sucursals", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nombre"
    t.string "direccion"
    t.string "tel"
    t.bigint "locality_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["locality_id"], name: "index_sucursals_on_locality_id"
  end

  create_table "turns", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "date"
    t.string "motive"
    t.integer "status", default: 0
    t.string "result"
    t.bigint "sucursal_id", null: false
    t.bigint "user_id", null: false
    t.bigint "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_turns_on_employee_id"
    t.index ["sucursal_id"], name: "index_turns_on_sucursal_id"
    t.index ["user_id"], name: "index_turns_on_user_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "rol", default: 2
    t.string "name"
    t.bigint "sucursals_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["sucursals_id"], name: "index_users_on_sucursals_id"
  end

  add_foreign_key "horarios", "sucursals"
  add_foreign_key "sucursales_horarios", "horarios"
  add_foreign_key "sucursales_horarios", "sucursals"
  add_foreign_key "sucursals", "localities"
  add_foreign_key "turns", "sucursals"
  add_foreign_key "turns", "users"
  add_foreign_key "turns", "users", column: "employee_id"
  add_foreign_key "users", "sucursals", column: "sucursals_id"
end
