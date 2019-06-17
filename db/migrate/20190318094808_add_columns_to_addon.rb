class AddColumnsToAddon < ActiveRecord::Migration
  def change
    add_column :addons, :name, :string
    add_column :addons, :price, :integer
  end
end
