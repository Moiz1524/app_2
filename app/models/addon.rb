class Addon < ActiveRecord::Base
    validates :name, presence: true
    validates_uniqueness_of :name
    belongs_to :admin
    belongs_to :item
end
