class AddBuyPriceVariantSize < ActiveRecord::Migration[6.0]
  def change
    remove_column :inventories, :buy_price
    add_column :variant_sizes, :buy_price, :integer
  end
end
