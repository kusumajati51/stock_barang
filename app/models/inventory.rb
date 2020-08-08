class Inventory < ApplicationRecord
    belongs_to :item
    has_many :minimum_sizes, dependent: :destroy
    has_many :variant_sizes, through: :minimum_sizes
    after_initialize :init
    def init
        self.check_in = 0
        self.stock = self.check_in
        self.check_out = 0
        # self.released_on = Date.today
    end
end