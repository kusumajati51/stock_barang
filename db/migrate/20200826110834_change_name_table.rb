class ChangeNameTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :item_in_transactions, :sales_invoice_id
    add_reference :item_in_transactions, :sales_invoice, foreign_key: true
    rename_table :item_in_transactions, :item_in
  end
end
