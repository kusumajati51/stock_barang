class CheckInItem < ApplicationRecord
    belongs_to :sales_invoice
    belongs_to :variant_size
    monetize :buy_price_cents
    after_create :increase_inventory

    def increase_inventory
        @item = Item.find(variant_size.item_id)
        @inventory = @item.inventory
        total = @inventory.stock + self.total_item
        check_in = @inventory.check_in + self.total_item
        @inventory.update(stock: total, check_in: check_in)
    end


end
