class NameColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :name, :name_items
    rename_column :categories, :name, :name_category
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
