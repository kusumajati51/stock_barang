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

ActiveRecord::Schema.define(version: 2020_08_29_181054) do

  create_table "brands", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "company"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_brands_on_user_id"
  end

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name_category"
    t.string "attachment"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "check_in_items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "total_item"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "variant_size_id"
    t.bigint "sales_invoice_id"
    t.integer "buy_price_cents", default: 0
    t.string "buy_price_currency", default: "IDR", null: false
    t.index ["sales_invoice_id"], name: "index_check_in_items_on_sales_invoice_id"
    t.index ["variant_size_id"], name: "index_check_in_items_on_variant_size_id"
  end

  create_table "inventories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "item_id"
    t.integer "stock"
    t.integer "check_in"
    t.integer "check_out"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_inventories_on_item_id"
  end

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name_items"
    t.bigint "category_id"
    t.string "product_picture"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "brand_id"
    t.index ["brand_id"], name: "index_items_on_brand_id"
    t.index ["category_id"], name: "index_items_on_category_id"
  end

  create_table "minimum_sizes", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "inventory_id"
    t.bigint "variant_size_id"
    t.index ["inventory_id"], name: "index_minimum_sizes_on_inventory_id"
    t.index ["variant_size_id"], name: "index_minimum_sizes_on_variant_size_id"
  end

  create_table "orders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "sold"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "variant_size_id"
    t.bigint "sales_invoice_id"
    t.integer "order_price_cents", default: 0
    t.string "order_price_currency", default: "IDR", null: false
    t.index ["sales_invoice_id"], name: "index_orders_on_sales_invoice_id"
    t.index ["variant_size_id"], name: "index_orders_on_variant_size_id"
  end

  create_table "sales_invoices", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "transaction_code"
    t.integer "transaction_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.integer "total_transaction_cents"
    t.string "total_transaction_currency", default: "IDR", null: false
    t.index ["user_id"], name: "index_sales_invoices_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "no_hp"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "variant_sizes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "variant_name"
    t.integer "qty_size"
    t.bigint "item_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "sell_price_cents", default: 0
    t.string "sell_price_currency", default: "IDR", null: false
    t.index ["item_id"], name: "index_variant_sizes_on_item_id"
  end

  add_foreign_key "brands", "users"
  add_foreign_key "categories", "users"
  add_foreign_key "check_in_items", "sales_invoices"
  add_foreign_key "check_in_items", "variant_sizes"
  add_foreign_key "inventories", "items"
  add_foreign_key "items", "brands"
  add_foreign_key "items", "categories"
  add_foreign_key "minimum_sizes", "inventories"
  add_foreign_key "minimum_sizes", "variant_sizes"
  add_foreign_key "orders", "sales_invoices"
  add_foreign_key "orders", "variant_sizes"
  add_foreign_key "sales_invoices", "users"
  add_foreign_key "variant_sizes", "items"
end
