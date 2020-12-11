class CreateInventory < ActiveRecord::Migration[6.0]
  def change
    create_table :inventories do |t|
      t.references :item, foreign_key: true
      t.integer :stock
      t.integer :check_in
      t.integer :check_out
      t.timestamps
    end
  end
end
