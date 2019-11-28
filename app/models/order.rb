class Order < ApplicationRecord
  belongs_to :item
  belongs_to :user
  before_create :set_invoice_code

  def set_invoice_code
    o = [('0'..'9'), ('A'..'Z')].map(&:to_a).flatten
    code = (0...6).map { o[rand(o.length)] }.join
    self.transaction_code =   Time.now.strftime("%m-%d-%Y") + "-" + code
    item.check_out = self.sold
    puts(item.id)
  end

end
