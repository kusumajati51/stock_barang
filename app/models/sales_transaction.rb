class SalesTransaction < ApplicationRecord
    belongs_to :item
    after_create :update_data
    has_one :order
    after_initialize :set_invoice_code
    has_one :item_in_transactions
    def set_invoice_code
        o = [('0'..'9'), ('A'..'Z')].map(&:to_a).flatten
        code = (0...6).map { o[rand(o.length)] }.join
        self.transaction_code =   Time.now.strftime("%m%d%Y") + "-" + code
        puts(item.id)
    end

    def update_data
        # item.inventory.update_columns(check_out: order.sold)
    end
end
