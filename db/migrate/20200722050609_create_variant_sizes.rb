class CreateVariantSizes < ActiveRecord::Migration[6.0]
  def change
    create_table :variant_sizes do |t|
      t.string :variant_name
      t.integer :sell_price
      t.integer :total
      t.integer :qty_size
      t.timestamps
    end
  end
end
