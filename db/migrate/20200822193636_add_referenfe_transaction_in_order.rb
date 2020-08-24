class AddReferenfeTransactionInOrder < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :transaction, foreign_key: true
    remove_column :orders, :transaction_code
  end
end
