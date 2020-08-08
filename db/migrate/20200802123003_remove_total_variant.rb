class RemoveTotalVariant < ActiveRecord::Migration[6.0]
  def change
    remove_column :variant_sizes, :total
  end
end
