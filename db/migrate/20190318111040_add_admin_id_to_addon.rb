class AddAdminIdToAddon < ActiveRecord::Migration
  def change
    add_column :addons, :admin_id, :integer
  end
end
