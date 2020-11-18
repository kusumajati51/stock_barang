class VariantSize < ApplicationRecord
    has_many :minimum_sizes, dependent: :destroy
    has_many :inventories, through: :minimum_sizes
    has_many :order
    belongs_to :item
    after_initialize :init
    validates_associated :item
    validates :variant_name, presence: true
    monetize :sell_price_cents


    # validates_with VariantSizeValidator, :attribute=>[:variant_name]
    def init
        if self.qty_size == nil
          self.qty_size = 1
        end
    end

    def should_validate_password?
      new_record?
    end

    def createAll(attributes = nil, &block)
        if attributes.is_a?(Array)
          attributes.collect { |attr| create(attr, &block) }
        else
          object = new(attributes, &block)
          object.save
          object
        end
    end
end
