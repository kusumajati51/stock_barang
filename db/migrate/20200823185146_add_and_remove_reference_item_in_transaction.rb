class AddAndRemoveReferenceItemInTransaction < ActiveRecord::Migration[6.0]
  def change
    remove_column :item_in_transactions, :item_id
    add_reference :item_in_transactions, :inventories, foreign_key: true
    add_reference :item_in_transactions, :variant_size, foreign_key: true
  end
end
