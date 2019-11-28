class OrderValidator < ActiveRecord::Validator
  def validate(record)
    if record.sold.nil?
      record.errors[:sold] << 'Please enter how many items have you been sold'
    end
    if record.stock == 0
        record.errors[:stock] << 'Your Stock is Empty'
    end
  end
end