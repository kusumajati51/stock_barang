class ChanceTableName < ActiveRecord::Migration[6.0]
  def change
    rename_table :order, :orders
  end
end
