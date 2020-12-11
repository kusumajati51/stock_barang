class CreateCheckInItems < ActiveRecord::Migration[6.0]
  def change
    create_table :check_in_items do |t|
      t.integer :total_item
      t.references :sales_invoice, foreign_key: true
      t.references :variant_size, foreign_key: true
      t.integer :total_pieces
      t.timestamps
    end
  end
end
