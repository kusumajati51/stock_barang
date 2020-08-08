class ArrangVariantSizes2 < ActiveRecord::Migration[6.0]
  def up
    change_table :variant_sizes do |t|
      t.change :created_at, :date, after: :item_id
      t.change :updated_at, :date, after: :created_at

    end
  end
end
