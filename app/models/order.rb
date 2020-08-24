class Order < ApplicationRecord
  belongs_to :sales_transaction
  belongs_to :variant_size
  validates :sold, numericality: { only_integer: true }
  
  # validates :sold, presence: true
  validate :validate_stock

  
  def validate_stock
    inventory = Inventory.find_by(item_id: variant_size.item_id)
    if inventory.stock < self.sold 
      errors.add(:stock, "the item is not enought")
    # elsif self.sold == 0
    #   errors.add(:stock, "you must buy item minimal 1 item")
    end
  end
end
