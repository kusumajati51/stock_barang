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

ActiveRecord::Schema.define(version: 2020_08_23_185146) do

  create_table "brands", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "company"
    t.bigint "category_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_brands_on_category_id"
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

  create_table "inventories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "item_id"
    t.integer "stock"
    t.integer "check_in"
    t.integer "check_out"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_inventories_on_item_id"
  end

  create_table "item_in_transactions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "buy_price"
    t.integer "total_item"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "sales_transaction_id"
    t.bigint "inventories_id"
    t.bigint "variant_size_id"
    t.index ["inventories_id"], name: "index_item_in_transactions_on_inventories_id"
    t.index ["sales_transaction_id"], name: "index_item_in_transactions_on_sales_transaction_id"
    t.index ["variant_size_id"], name: "index_item_in_transactions_on_variant_size_id"
  end

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name_items"
    t.bigint "category_id"
    t.string "product_picture"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "brand_id"
    t.index ["brand_id"], name: "index_items_on_brand_id"
    t.index ["category_id"], name: "index_items_on_category_id"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "minimum_sizes", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "inventory_id"
    t.bigint "variant_size_id"
    t.index ["inventory_id"], name: "index_minimum_sizes_on_inventory_id"
    t.index ["variant_size_id"], name: "index_minimum_sizes_on_variant_size_id"
  end

  create_table "orders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "sold"
    t.integer "price"
    t.bigint "item_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.bigint "sales_transaction_id"
    t.index ["item_id"], name: "index_orders_on_item_id"
    t.index ["sales_transaction_id"], name: "index_orders_on_sales_transaction_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "sales_transactions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "transaction_code"
    t.integer "transaction_type"
    t.bigint "user_id", null: false
    t.bigint "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_sales_transactions_on_item_id"
    t.index ["user_id"], name: "index_sales_transactions_on_user_id"
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
    t.integer "sell_price"
    t.integer "buy_price"
    t.integer "qty_size"
    t.bigint "item_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_variant_sizes_on_item_id"
  end

  add_foreign_key "brands", "categories"
  add_foreign_key "brands", "users"
  add_foreign_key "categories", "users"
  add_foreign_key "inventories", "items"
  add_foreign_key "item_in_transactions", "inventories", column: "inventories_id"
  add_foreign_key "item_in_transactions", "sales_transactions"
  add_foreign_key "item_in_transactions", "variant_sizes"
  add_foreign_key "items", "brands"
  add_foreign_key "items", "categories"
  add_foreign_key "items", "users"
  add_foreign_key "minimum_sizes", "inventories"
  add_foreign_key "minimum_sizes", "variant_sizes"
  add_foreign_key "orders", "items"
  add_foreign_key "orders", "sales_transactions"
  add_foreign_key "orders", "users"
  add_foreign_key "sales_transactions", "items"
  add_foreign_key "sales_transactions", "users"
  add_foreign_key "variant_sizes", "items"
end
