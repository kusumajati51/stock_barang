class ChangeReferenceName < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :sales_invoice_id
    add_reference :orders, :sales_invoice, foreign_key: true
  end
end
