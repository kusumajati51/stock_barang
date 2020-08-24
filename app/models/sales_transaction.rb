class SalesTransaction < ApplicationRecord
    belongs_to :item
    belongs_to :user
    after_initialize :set_invoice_code
    has_many :order
    has_many :item_in_transactions
    def set_invoice_code
        o = [('0'..'9'), ('A'..'Z')].map(&:to_a).flatten
        code = (0...6).map { o[rand(o.length)] }.join
        self.transaction_code =   Time.now.strftime("%m%d%Y") + "-" + code
        puts(item.id)
    end
end
