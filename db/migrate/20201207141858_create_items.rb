class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name_items
      t.references :category, foreign_key: true
      t.references :brand, foreign_key: true
      t.integer :price
      t.string :product_picture
      t.timestamps
    end
  end
end