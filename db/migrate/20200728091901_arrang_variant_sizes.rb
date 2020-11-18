class ArrangVariantSizes < ActiveRecord::Migration[6.0]
  def up
    change_table :variant_sizes do |t|
      t.change :buy_price, :integer, after: :sell_price
    end
  end
end
