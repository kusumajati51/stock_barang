class CreateOrder < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :buy_price
      t.integer :total_item
      t.references :sales_invoice, foreign_key: true
      t.references :variant_size, foreign_key: true
      t.integer :sold
      t.integer :total_pieces
      t.timestamps
    end
  end
end
