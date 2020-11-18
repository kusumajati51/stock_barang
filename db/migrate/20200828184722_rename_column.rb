class RenameColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :variant_sizes, :buy_price_cents
    remove_column :variant_sizes, :buy_price_currency
    add_monetize :variant_sizes, :sell_price, amount: {null: true, default: 0}

    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
