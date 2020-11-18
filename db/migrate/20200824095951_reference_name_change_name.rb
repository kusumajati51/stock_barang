class ReferenceNameChangeName < ActiveRecord::Migration[6.0]
  def change
    rename_column :orders, :variant_sizes_id, :variant_size_id
  end
end
