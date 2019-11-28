class ChanceTabelName < ActiveRecord::Migration[6.0]
  def change
    rename_table :product, :order
  end
end
