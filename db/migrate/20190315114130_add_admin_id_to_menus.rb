class AddAdminIdToMenus < ActiveRecord::Migration
  def change
    add_column :menus, :admin_id, :integer
  end
end
