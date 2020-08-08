class Add < ActiveRecord::Migration[6.0]
  def change
    add_reference :variant_sizes, :inventories, foreign_key: true
    add_reference :inventories, :variant_sizes, foreign_key: true
  end
end
