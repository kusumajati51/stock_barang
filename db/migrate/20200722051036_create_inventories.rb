class CreateInventories < ActiveRecord::Migration[6.0]
  def change
    create_table :inventories do |t|
      t.references :item, foreign_key: true
      t.integer :buy_price
      t.integer :stock
      t.integer :check_in
      t.integer :chek_out
      t.timestamps
    end
  end
end
