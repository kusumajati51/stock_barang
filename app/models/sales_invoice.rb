class SalesInvoice < ApplicationRecord
    belongs_to :user
    after_create :update_data
    has_many :orders
    after_initialize :set_invoice_code
    has_many :check_in_items
    monetize :total_transaction_cents
    validates_associated_bubbling :orders
    # scope :orders ,->{ joins(:orders).where('orders.variant_size_id is not null') }
 
    def set_invoice_code
        o = [('0'..'9'), ('A'..'Z')].map(&:to_a).flatten
        code = (0...6).map { o[rand(o.length)] }.join
        self.transaction_code =   Time.now.strftime("%m%d%Y") + "-" + code
    end

    def update_data
        # item.inventory.update_columns(check_out: order.sold)
    end
end
