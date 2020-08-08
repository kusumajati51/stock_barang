class RenameColumnInInventory < ActiveRecord::Migration[6.0]
  def change
    rename_column :inventories, :chek_out, :check_out
  end
end
