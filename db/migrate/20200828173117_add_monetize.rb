class AddMonetize < ActiveRecord::Migration[6.0]
  def change
    # remove_column :variant_sizes, :sell_price
    # remove_column :variant_sizes, :buy_price
    # remove_column :orders, :price
    # remove_column :item_in, :buy_price

    add_monetize :variant_sizes, :buy_price, amount: {null: true, default: 0}
    add_monetize :orders, :order_price, amount: {null: true, default: 0}
    add_monetize :item_in, :buy_price, amount: {null: true, default: 0}

  end
end
