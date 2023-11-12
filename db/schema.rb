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

ActiveRecord::Schema[7.1].define(version: 2023_11_11_180032) do
  create_table "razor_pay_orders", force: :cascade do |t|
    t.string "order_id", null: false
    t.string "entity"
    t.decimal "amount", precision: 10, scale: 2
    t.decimal "amount_paid", precision: 10, scale: 2
    t.decimal "amount_due", precision: 10, scale: 2
    t.string "currency"
    t.string "receipt"
    t.string "offer_id"
    t.string "status"
    t.integer "attempts"
    t.text "notes"
    t.datetime "payment_at"
    t.string "payment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_razor_pay_orders_on_order_id"
    t.index ["receipt"], name: "index_razor_pay_orders_on_receipt"
  end

end
