class ChangeNameRelation < ActiveRecord::Migration[6.0]
  def change
    rename_column :inventories, :variant_sizes_id, :minimum_size_id
  end
end
