class AdjustingNameParamMinimumSize2 < ActiveRecord::Migration[6.0]
  def change
    remove_column :minimum_sizes, :variant_sizes_id
    add_reference :minimum_sizes, :variant_size, foreign_key: true
  end
end
