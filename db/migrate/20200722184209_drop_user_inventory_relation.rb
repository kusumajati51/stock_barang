class DropUserInventoryRelation < ActiveRecord::Migration[6.0]
  def change
    remove_column :inventories, :user_id
    remove_column :variant_sizes, :user_id
  end
end
