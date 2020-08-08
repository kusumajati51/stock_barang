class FixingNameMinimuSizeTable < ActiveRecord::Migration[6.0]
  def change
    rename_table :minimum_size, :minimum_sizes
  end
end
