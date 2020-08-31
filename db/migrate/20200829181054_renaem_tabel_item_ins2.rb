class RenaemTabelItemIns2 < ActiveRecord::Migration[6.0]
  def change
    rename_table :check_in_item, :check_in_items

  end
end
