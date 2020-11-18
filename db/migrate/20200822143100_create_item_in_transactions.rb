class CreateItemInTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :item_in_transactions do |t|
      t.integer :buy_price
      t.integer :total_item
      t.references :transaction, foreign_key: true
      t.references :item, foreign_key: true
      t.timestamps
    end
  end
end
