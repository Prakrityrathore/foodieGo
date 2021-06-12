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

ActiveRecord::Schema.define(version: 2021_06_12_070034) do

  create_table "customers", force: :cascade do |t|
    t.integer "order_id"
    t.string "name", null: false
    t.integer "phone_number", null: false
    t.string "delivery_address", null: false
    t.string "payment_method"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_customers_on_order_id"
  end

  create_table "dishes", force: :cascade do |t|
    t.integer "restaurant_id"
    t.string "name", null: false
    t.string "cuisine"
    t.decimal "price", precision: 5, scale: 2, null: false
    t.float "ratings", null: false
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["restaurant_id"], name: "index_dishes_on_restaurant_id"
  end

  create_table "order_placments", force: :cascade do |t|
    t.integer "order_id"
    t.integer "dish_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dish_id"], name: "index_order_placments_on_dish_id"
    t.index ["order_id"], name: "index_order_placments_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "restaurant_id"
    t.integer "dish_id"
    t.decimal "sum"
    t.integer "quantity", default: 1
    t.string "payment_method"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dish_id"], name: "index_orders_on_dish_id"
    t.index ["restaurant_id"], name: "index_orders_on_restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.text "opening_hours"
    t.string "email"
    t.boolean "accept_reservation", default: true
    t.boolean "home_deliveries", default: true
    t.integer "phone_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "customers", "orders"
  add_foreign_key "dishes", "restaurants"
  add_foreign_key "orders", "restaurants"
end
