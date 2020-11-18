class RemoveReference2 < ActiveRecord::Migration[6.0]
  def change
    remove_column :sales_transactions, :user_id
    add_reference :sales_transactions, :item, foreign_key: true
  end
end
