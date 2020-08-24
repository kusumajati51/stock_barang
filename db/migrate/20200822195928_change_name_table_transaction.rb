class ChangeNameTableTransaction < ActiveRecord::Migration[6.0]
  def change
    rename_table :transactions, :sales_transactions
  end
end
