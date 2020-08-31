class ChangeNameReference < ActiveRecord::Migration[6.0]
  def change
    rename_table :item_in_transactions, :item_in
  end
end
