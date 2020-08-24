class AddTimestampSalesTransaction < ActiveRecord::Migration[6.0]
  def change
    add_column :sales_transactions, :created_at, :datetime, null: false
    add_column :sales_transactions, :updated_at, :datetime, null: false
  end
end
