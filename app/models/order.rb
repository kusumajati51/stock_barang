class Order < ApplicationRecord
  belongs_to :item
  belongs_to :user
  belongs_to :sales_transaction
  after_initialize :update_data
  validate :validate_stock

  
  def validate_stock
    inventory = Inventory.find_by(item_id: item.id)
    if inventory.stock < self.sold 
      errors.add(:stock, inventory)
    # elsif self.sold == 0
    #   errors.add(:stock, "you must buy item minimal 1 item")
    end
  end
  def update_data
    item.inventory.update_columns(check_out: self.sold)
  end
end
