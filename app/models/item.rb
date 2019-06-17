class Item < ActiveRecord::Base
    belongs_to :menu
    has_many :addons
    accepts_nested_attributes_for :addons, reject_if: :all_blank, allow_destroy: true
end
