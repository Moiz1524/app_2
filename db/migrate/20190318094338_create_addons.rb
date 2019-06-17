class CreateAddons < ActiveRecord::Migration
  def change
    create_table :addons do |t|

      t.timestamps null: false
    end
  end
end
