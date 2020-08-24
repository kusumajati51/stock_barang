class RemoveReference < ActiveRecord::Migration[6.0]
  def change
    remove_column :brands, :category_id
    remove_column :sales_transactions, :item_id
    remove_column :item_in_transactions, :inventories_id
    remove_column :orders, :item_id
    remove_column :orders, :user_id
    add_reference :orders, :variant_sizes, foreign_key: true
  end
end
