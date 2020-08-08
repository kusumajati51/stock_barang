class AdjustingColumnItem < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :check_out
    remove_column :items, :check_in
    remove_column :items, :released_on
  end
end
