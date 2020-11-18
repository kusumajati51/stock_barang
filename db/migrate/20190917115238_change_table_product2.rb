class ChangeTableProduct2 < ActiveRecord::Migration[6.0]
  def self.up
    rename_column :products, :attachment, :product_picture
  end

  def self.down
    add_column :products, :check_out, :integer
    add_column :products, :stock, :integer
  end
end
