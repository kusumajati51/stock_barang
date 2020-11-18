class UpdateColumnOrder < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :transaction_id
    remove_column :item_in_transactions, :transaction_id
    add_reference :orders, :sales_transaction, foreign_key: true
    add_reference :item_in_transactions, :sales_transaction, foreign_key: true
  end
end
