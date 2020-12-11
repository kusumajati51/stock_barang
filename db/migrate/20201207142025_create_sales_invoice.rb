class CreateSalesInvoice < ActiveRecord::Migration[6.0]
  def change
    create_table :sales_invoices do |t|
      t.references :user, foreign_key: true
      t.string :transaction_code
      t.integer :transaction_type
      t.timestamps
    end
  end
end
