class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.references :category, foreign_key: true
      t.integer :price
      t.string :attachment
      t.date :released_on
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
