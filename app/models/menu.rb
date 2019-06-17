class Menu < ActiveRecord::Base
    belongs_to :admin
    has_many :items
end
