class CreateBrand < ActiveRecord::Migration[6.0]
  def change
    create_table :brands do |t|
      t.string :name
      t.string :company
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
