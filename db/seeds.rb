UserWeb.create!([
  {email: "tester@tester.com", password_digest: "$2a$12$N2LA4KqhhuXSnLS/hS5mk.vIIbv5IAs8tEbJffwFtB7l9ugV5scPa", no_hp: "089732939213", name: "tester"},
  {email: "tester12@tester.com", password_digest: "$2a$12$rzMDhMyDs1nbgj4vqdTLDe/6mq47EbFV9gKjyrtPnD0X6tg0rYswq", no_hp: "08973293921123", name: "testera"}
])
Category.create!([
  {name_category: "Rokok", attachment: "ilustrasi-rokok-2.jpg", user_id: 1},
  {name_category: "Kopi", attachment: "kopi_icon.png", user_id: 1}
])
Brand.create!([
  {name: "Maju Bersama ", company: "Saha eta", user_id: 1},
  {name: "Gudang Garam", company: "Gudang Garam tbk", user_id: 1},
  {name: "Kapal Api", company: "Kapal Api tbk", user_id: 1},
  {name: "Sampoerna", company: "Sampoerna tbk", user_id: 1},
  {name: "Ajiz Brand", company: "Ajiz Kencana", user_id: 1},
  {name: "Kuda Liar", company: "Pt Kuda Sejahtera", user_id: 1},
  {name: "Awan Kinton", company: "SunggoKong", user_id: 1},
  {name: " Malik Bersama", company: " Malik ", user_id: 1},
  {name: " Malik Bersama", company: " Malik ", user_id: 1}
])
Item.create!([
  {name_items: "Gudang Garam Filter", category_id: 1, product_picture: "download.png", brand_id: 1},
  {name_items: "Gudang Garam Surya", category_id: 1, product_picture: "download.png", brand_id: 1},
  {name_items: "Sampoerna Mild", category_id: 1, product_picture: "download.png", brand_id: 1},
  {name_items: "DjiSamSoe", category_id: 1, product_picture: "download.png", brand_id: 1},
  {name_items: "Malboro", category_id: 1, product_picture: "download.png", brand_id: 1},
  {name_items: "Djarum Super", category_id: 1, product_picture: "download.png", brand_id: 1},
  {name_items: "Cap Tikus", category_id: 1, product_picture: "download.png", brand_id: 1},
  {name_items: "asdasdas", category_id: 1, product_picture: "download.png", brand_id: 1},
  {name_items: "Cap Harimau", category_id: 1, product_picture: "download.png", brand_id: 1},
  {name_items: "Kuda Tirus", category_id: 1, product_picture: "download.png", brand_id: 1},
  {name_items: "Cap Bajing", category_id: 1, product_picture: "download.png", brand_id: 1}
])

VariantSize.create!([
  {variant_name: "batang", qty_size: 1, item_id: 1, sell_price_cents: 1000, sell_price_currency: "IDR"},
  {variant_name: "batang", qty_size: 8, item_id: 2, sell_price_cents: 1000, sell_price_currency: "IDR"},
  {variant_name: "batang", qty_size: 8, item_id: 3, sell_price_cents: 1000, sell_price_currency: "IDR"},
  {variant_name: "batang", qty_size: 8, item_id: 4, sell_price_cents: 1000, sell_price_currency: "IDR"},
  {variant_name: "batang", qty_size: 1, item_id: 5, sell_price_cents: 1000, sell_price_currency: "IDR"},
  {variant_name: "batang", qty_size: 1, item_id: 6, sell_price_cents: 1000, sell_price_currency: "IDR"},
  {variant_name: "piece", qty_size: 1, item_id: 7, sell_price_cents: 1000, sell_price_currency: "IDR"},
  {variant_name: "piece", qty_size: 1, item_id: 8, sell_price_cents: 1900, sell_price_currency: "IDR"},
  {variant_name: "piece", qty_size: 1, item_id: 9, sell_price_cents: 1000, sell_price_currency: "IDR"},
  {variant_name: "piece", qty_size: 1, item_id: 10, sell_price_cents: 1000, sell_price_currency: "IDR"},
  {variant_name: "bungkus", qty_size: 16, item_id: 1, sell_price_cents: 21000, sell_price_currency: "IDR"},
  {variant_name: "bungkus kecil", qty_size: 12, item_id: 1, sell_price_cents: 16000, sell_price_currency: "IDR"},
  {variant_name: "batang", qty_size: 1, item_id: 11, sell_price_cents: 1000, sell_price_currency: "IDR"}
])
Inventory.create!([
  {item_id: 1, stock: 868, check_in: 1296, check_out: 428},
  {item_id: 2, stock: 231, check_in: 306, check_out: 285},
  {item_id: 3, stock: 118, check_in: 20, check_out: 2},
  {item_id: 4, stock: 360, check_in: 260, check_out: 0},
  {item_id: 5, stock: 1030, check_in: 20, check_out: 90},
  {item_id: 6, stock: 120, check_in: 20, check_out: 0},
  {item_id: 7, stock: 120, check_in: 20, check_out: 0},
  {item_id: 8, stock: 120, check_in: 10, check_out: 0},
  {item_id: 9, stock: 130, check_in: 30, check_out: 0},
  {item_id: 10, stock: 900, check_in: 900, check_out: 0},
  {item_id: 11, stock: 120, check_in: 20, check_out: 0}
])


MinimumSize.create!([
  {inventory_id: 1, variant_size_id: 1},
  {inventory_id: 2, variant_size_id: 2},
  {inventory_id: 3, variant_size_id: 3},
  {inventory_id: 4, variant_size_id: 4},
  {inventory_id: 5, variant_size_id: 5},
  {inventory_id: 6, variant_size_id: 6},
  {inventory_id: 7, variant_size_id: 7},
  {inventory_id: 8, variant_size_id: 8},
  {inventory_id: 9, variant_size_id: 9},
  {inventory_id: 10, variant_size_id: 10},
  {inventory_id: 11, variant_size_id: 13}
])

SalesInvoice.create!([
  {transaction_code: "11202020-JY6BPE", transaction_type: 1, user_id: 1, total_transaction_cents: 22000, total_transaction_currency: "IDR"},
  {transaction_code: "11202020-S6PJYN", transaction_type: 1, user_id: 1, total_transaction_cents: 22000, total_transaction_currency: "IDR"},
  {transaction_code: "11202020-KDG22G", transaction_type: 1, user_id: 1, total_transaction_cents: 22000, total_transaction_currency: "IDR"},
  {transaction_code: "11202020-LXD2WG", transaction_type: 1, user_id: 1, total_transaction_cents: 22000, total_transaction_currency: "IDR"},
  {transaction_code: "11202020-FNAMVJ", transaction_type: 1, user_id: 1, total_transaction_cents: 22000, total_transaction_currency: "IDR"},
  {transaction_code: "11202020-1GWQFB", transaction_type: 1, user_id: 1, total_transaction_cents: 22000, total_transaction_currency: "IDR"},
  {transaction_code: "11202020-7PBL8J", transaction_type: 1, user_id: 1, total_transaction_cents: 22000, total_transaction_currency: "IDR"},
  {transaction_code: "11202020-DV2HEM", transaction_type: 1, user_id: 1, total_transaction_cents: 22000, total_transaction_currency: "IDR"},
  {transaction_code: "11202020-85R12D", transaction_type: 1, user_id: 1, total_transaction_cents: 22000, total_transaction_currency: "IDR"},
  {transaction_code: "11202020-H31OT7", transaction_type: 1, user_id: 1, total_transaction_cents: 22000, total_transaction_currency: "IDR"},
  {transaction_code: "11202020-MPTJ9B", transaction_type: 1, user_id: 1, total_transaction_cents: 22000, total_transaction_currency: "IDR"},
  {transaction_code: "11202020-CXMDYV", transaction_type: 1, user_id: 1, total_transaction_cents: 22000, total_transaction_currency: "IDR"},
  {transaction_code: "11202020-62UHR2", transaction_type: 1, user_id: 1, total_transaction_cents: 116000, total_transaction_currency: "IDR"},
  {transaction_code: "11202020-3MHDBQ", transaction_type: 1, user_id: 1, total_transaction_cents: 5000, total_transaction_currency: "IDR"},
  {transaction_code: "11202020-N845FH", transaction_type: 2, user_id: 1, total_transaction_cents: 36000, total_transaction_currency: "IDR"},
  {transaction_code: "11202020-5YT7EJ", transaction_type: 2, user_id: 1, total_transaction_cents: 360000, total_transaction_currency: "IDR"},
  {transaction_code: "11202020-C7NQ3F", transaction_type: 2, user_id: 1, total_transaction_cents: 360000, total_transaction_currency: "IDR"},
  {transaction_code: "11202020-B1UW99", transaction_type: 1, user_id: 1, total_transaction_cents: 62000, total_transaction_currency: "IDR"},
  {transaction_code: "11202020-F0PAEM", transaction_type: 1, user_id: 1, total_transaction_cents: 62000, total_transaction_currency: "IDR"},
  {transaction_code: "11202020-JMMKNO", transaction_type: 1, user_id: 1, total_transaction_cents: 62000, total_transaction_currency: "IDR"},
  {transaction_code: "11202020-ZL5KUX", transaction_type: 2, user_id: 1, total_transaction_cents: 7200, total_transaction_currency: "IDR"},
  {transaction_code: "11202020-FMM20G", transaction_type: 2, user_id: 1, total_transaction_cents: 96000, total_transaction_currency: "IDR"}
])
CheckInItem.create!([
  {total_item: 3, variant_size_id: 2, sales_invoice_id: 15, buy_price_cents: 12000, buy_price_currency: "IDR", total_pieces: 24},
  {total_item: 30, variant_size_id: 2, sales_invoice_id: 16, buy_price_cents: 12000, buy_price_currency: "IDR", total_pieces: 240},
  {total_item: 30, variant_size_id: 4, sales_invoice_id: 17, buy_price_cents: 12000, buy_price_currency: "IDR", total_pieces: 240},
  {total_item: 6, variant_size_id: 11, sales_invoice_id: 21, buy_price_cents: 1200, buy_price_currency: "IDR", total_pieces: 96},
  {total_item: 8, variant_size_id: 11, sales_invoice_id: 22, buy_price_cents: 12000, buy_price_currency: "IDR", total_pieces: 128}
  
])

Order.create!([
  {sold: 12, variant_size_id: 2, sales_invoice_id: 1, order_price_cents: 12000, order_price_currency: "IDR", total_pieces: 96},
  {sold: 10, variant_size_id: 1, sales_invoice_id: 2, order_price_cents: 10000, order_price_currency: "IDR", total_pieces: 10},
  {sold: 12, variant_size_id: 2, sales_invoice_id: 3, order_price_cents: 52000, order_price_currency: "IDR", total_pieces: 96},
  {sold: 10, variant_size_id: 1, sales_invoice_id: 4, order_price_cents: 10000, order_price_currency: "IDR", total_pieces: 10},
  {sold: 12, variant_size_id: 2, sales_invoice_id: 5, order_price_cents: 12000, order_price_currency: "IDR", total_pieces: 96},
  {sold: 10, variant_size_id: 1, sales_invoice_id: 6, order_price_cents: 10000, order_price_currency: "IDR", total_pieces: 10},
  {sold: 12, variant_size_id: 2, sales_invoice_id: 7, order_price_cents: 12000, order_price_currency: "IDR", total_pieces: 96},
  {sold: 10, variant_size_id: 5, sales_invoice_id: 7, order_price_cents: 10000, order_price_currency: "IDR", total_pieces: 10},
  {sold: 12, variant_size_id: 2, sales_invoice_id: 8, order_price_cents: 12000, order_price_currency: "IDR", total_pieces: 96},
  {sold: 10, variant_size_id: 5, sales_invoice_id: 8, order_price_cents: 10000, order_price_currency: "IDR", total_pieces: 10},
  {sold: 12, variant_size_id: 2, sales_invoice_id: 9, order_price_cents: 12000, order_price_currency: "IDR", total_pieces: 96},
  {sold: 10, variant_size_id: 5, sales_invoice_id: 9, order_price_cents: 10000, order_price_currency: "IDR", total_pieces: 10},
  {sold: 12, variant_size_id: 2, sales_invoice_id: 10, order_price_cents: 12000, order_price_currency: "IDR", total_pieces: 96},
  {sold: 10, variant_size_id: 5, sales_invoice_id: 10, order_price_cents: 10000, order_price_currency: "IDR", total_pieces: 10},
  {sold: 12, variant_size_id: 2, sales_invoice_id: 10, order_price_cents: 12000, order_price_currency: "IDR", total_pieces: 96},
  {sold: 10, variant_size_id: 5, sales_invoice_id: 10, order_price_cents: 10000, order_price_currency: "IDR", total_pieces: 10},
  {sold: 12, variant_size_id: 2, sales_invoice_id: 10, order_price_cents: 12000, order_price_currency: "IDR", total_pieces: 96},
  {sold: 10, variant_size_id: 5, sales_invoice_id: 10, order_price_cents: 10000, order_price_currency: "IDR", total_pieces: 10},
  {sold: 12, variant_size_id: 2, sales_invoice_id: 10, order_price_cents: 12000, order_price_currency: "IDR", total_pieces: 96},
  {sold: 10, variant_size_id: 5, sales_invoice_id: 10, order_price_cents: 10000, order_price_currency: "IDR", total_pieces: 10},
  {sold: 12, variant_size_id: 2, sales_invoice_id: 11, order_price_cents: 12000, order_price_currency: "IDR", total_pieces: 96},
  {sold: 10, variant_size_id: 5, sales_invoice_id: 11, order_price_cents: 10000, order_price_currency: "IDR", total_pieces: 10},
  {sold: 12, variant_size_id: 2, sales_invoice_id: 12, order_price_cents: 12000, order_price_currency: "IDR", total_pieces: 96},
  {sold: 10, variant_size_id: 5, sales_invoice_id: 12, order_price_cents: 10000, order_price_currency: "IDR", total_pieces: 10},
  {sold: 5, variant_size_id: 11, sales_invoice_id: 12, order_price_cents: 105000, order_price_currency: "IDR", total_pieces: 80},
  {sold: 9, variant_size_id: 2, sales_invoice_id: 13, order_price_cents: 9000, order_price_currency: "IDR", total_pieces: 72},
  {sold: 2, variant_size_id: 3, sales_invoice_id: 13, order_price_cents: 2000, order_price_currency: "IDR", total_pieces: 16},
  {sold: 5, variant_size_id: 1, sales_invoice_id: 14, order_price_cents: 5000, order_price_currency: "IDR", total_pieces: 5},
  {sold: 12, variant_size_id: 2, sales_invoice_id: 18, order_price_cents: 12000, order_price_currency: "IDR", total_pieces: 96},
  {sold: 50, variant_size_id: 1, sales_invoice_id: 18, order_price_cents: 50000, order_price_currency: "IDR", total_pieces: 50},
  {sold: 12, variant_size_id: 2, sales_invoice_id: 19, order_price_cents: 12000, order_price_currency: "IDR", total_pieces: 96},
  {sold: 50, variant_size_id: 1, sales_invoice_id: 19, order_price_cents: 50000, order_price_currency: "IDR", total_pieces: 50},
  {sold: 12, variant_size_id: 2, sales_invoice_id: 20, order_price_cents: 12000, order_price_currency: "IDR", total_pieces: 96},
  {sold: 50, variant_size_id: 1, sales_invoice_id: 20, order_price_cents: 50000, order_price_currency: "IDR", total_pieces: 50}
])



