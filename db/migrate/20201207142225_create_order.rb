class CreateOrder < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :sold
      t.integer :total_pieces
      t.references :sales_invoice, foreign_key: true
      t.references :variant_size, foreign_key: true
      t.timestamps
    end
  end
end
