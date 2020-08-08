class Order < ApplicationRecord
  belongs_to :item
  before_create :set_invoice_code
  after_initialize :update_data
  validate :validate_stock

  def set_invoice_code
    o = [('0'..'9'), ('A'..'Z')].map(&:to_a).flatten
    code = (0...6).map { o[rand(o.length)] }.join
    self.transaction_code =   Time.now.strftime("%m%d%Y") + "-" + code
    puts(item.id)
  end
  
  def validate_stock
    inventory = Inventory.find_by(item_id: item.id)
    if inventory.stock < self.sold
      errors.add(:stock, "Stock not enough")
    end
  end
  def update_data
    item.inventory.update_columns(check_out: self.sold)
  end
end
