class MakeRelation < ActiveRecord::Migration[6.0]
  def change
    remove_column :minimum_size, :inventory_id
    add_reference :minimum_size, :inventory, foreign_key: true
    remove_column :minimum_size, :variant_size_id
    add_reference :minimum_size, :variant_sizes, foreign_key: true
  end
end
