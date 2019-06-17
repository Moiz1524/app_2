class AddColumnToAddon < ActiveRecord::Migration
  def change
    add_column :addons, :item_id, :integer
  end
end
