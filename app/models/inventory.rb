class Inventory < ApplicationRecord
    belongs_to :item
    has_many :minimum_sizes, dependent: :destroy
    has_many :variant_sizes, through: :minimum_sizes
    after_create :init
    self.table_name = "inventories"
    def init
        if self.check_in == 0
            self.check_in = 0
        end
        self.check_out = 0
        self.stock = self.check_in
        # self.released_on = Date.today
    end
end
