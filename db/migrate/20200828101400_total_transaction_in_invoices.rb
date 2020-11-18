class TotalTransactionInInvoices < ActiveRecord::Migration[6.0]
  def change
    add_money :sales_invoices, :total_transaction, amount: {null: true, default: nil}
  end
end
