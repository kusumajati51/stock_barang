class ChangeReference < ActiveRecord::Migration[6.0]
  def change
    remove_column :sales_transactions, :item_id
    add_reference :sales_transactions, :user, foreign_key: true
  end
end
