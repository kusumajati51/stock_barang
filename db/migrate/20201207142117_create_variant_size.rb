class CreateVariantSize < ActiveRecord::Migration[6.0]
  def change
    create_table :variant_sizes do |t|
      t.string :variant_name
      t.integer :qty_size
      t.references :item, foreign_key: true
      t.timestamps
    end
  end
end
