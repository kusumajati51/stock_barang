class RenaemTabelItemIns < ActiveRecord::Migration[6.0]
  def change
    rename_table :item_in, :check_in_item
  end
end
