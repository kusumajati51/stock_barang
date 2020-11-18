class ChangeNameRaltion < ActiveRecord::Migration[6.0]
  def change
    rename_column :inventories, :minimum_size_id, :minimum_id
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
