class AddMonnetize < ActiveRecord::Migration[6.0]
  def change
    add_monetize :variant_sizes, :sell_price, amount: {null: true, default: 0}
    add_monetize :orders, :order_price, amount: {null: true, default: 0}
    add_monetize :check_in_items, :buy_price, amount: {null: true, default: 0}
    add_monetize :sales_invoices, :total_transaction, amount: {null: true, default: 0}
  end
end
