class CreateCategory < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name_category
      t.string :attachment
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
