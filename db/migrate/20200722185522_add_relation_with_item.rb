class AddRelationWithItem < ActiveRecord::Migration[6.0]
  def change
    add_reference :variant_sizes, :item, foreign_key: true

  end
end
