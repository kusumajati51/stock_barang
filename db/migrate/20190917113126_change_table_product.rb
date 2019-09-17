class ChangeTableProduct < ActiveRecord::Migration[6.0]
  def self.up
    add_column :products, :check_in, :integer
    
  end

end
