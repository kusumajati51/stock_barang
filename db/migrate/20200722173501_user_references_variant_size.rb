class UserReferencesVariantSize < ActiveRecord::Migration[6.0]
  def change
    add_reference :variant_sizes, :user, foreign_key: true
  end
end
