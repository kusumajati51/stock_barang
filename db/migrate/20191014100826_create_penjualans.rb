class CreatePenjualans < ActiveRecord::Migration[6.0]
  def change
    create_table :product do |t|
      t.string :transaction_code
      t.integer :sold
      t.integer :price
      t.references :item, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
