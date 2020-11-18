class ChangeNameTabel < ActiveRecord::Migration[6.0]
  def change
    rename_table :sales_transactions, :sales_invoices
  end
end
