class RemoveReference3 < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :user_id
  end
end
