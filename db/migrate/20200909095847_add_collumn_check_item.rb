class AddCollumnCheckItem < ActiveRecord::Migration[6.0]
  def change
    add_column :check_in_items, :total_pieces, :integer
    add_column :orders, :total_pieces, :integer
  end
end
