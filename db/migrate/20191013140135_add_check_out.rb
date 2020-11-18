class AddCheckOut < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :check_out, :integer
  end
end
