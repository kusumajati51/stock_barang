class UserReferencesInventory < ActiveRecord::Migration[6.0]
  def change
    add_reference :inventories, :user, foreign_key: true
  end
end
