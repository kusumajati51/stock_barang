class ChangeTableName < ActiveRecord::Migration[6.0]
  def change
    rename_table :inventories_variant_sizes, :minimum_size
    remove_column :inventories, :minimum_id
    remove_column :variant_sizes, :inventories_id
  end
end
