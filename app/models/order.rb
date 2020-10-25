class Order < ApplicationRecord
  belongs_to :sales_invoice
  belongs_to :variant_size
  validates :sold, numericality: { only_integer: true }
  # Ex:- scope :active, -> {where(:active => true)}
  # validates :sold, presence: true
  validate :validate_stock
  monetize :order_price_cents
  after_create :decrease_inventory
  
  def validate_stock
    item = Item.find(variant_size.item_id)
    inventory = Inventory.find_by(item_id: variant_size.item_id)
    if inventory.stock < self.sold 
      errors.add(:stock, "#{item.name_items} is not enought")
    # elsif self.sold == 0
    #   errors.add(:stock, "you must buy item minimal 1 item")
    end
  end

  def decrease_inventory
    @item = Item.find(variant_size.item_id)
    @inventory = @item.inventory
    total = @inventory.stock- self.sold
    check_out = @inventory.check_out + self.sold
    @inventory.update(stock: total, check_out: check_out)
  end

  
end