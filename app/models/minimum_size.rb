class MinimumSize < ApplicationRecord
    belongs_to :inventory
    belongs_to :variant_size
    self.table_name = "inventories_variant_sizes"
end
