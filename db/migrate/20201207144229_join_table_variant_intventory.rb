class JoinTableVariantIntventory < ActiveRecord::Migration[6.0]
  def change
    create_join_table :inventories, :variant_sizes
  end
end
