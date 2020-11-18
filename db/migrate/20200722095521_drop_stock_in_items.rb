class DropStockInItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :stock, :check_in, :check_out
  end
end
