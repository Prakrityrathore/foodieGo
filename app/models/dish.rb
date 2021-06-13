class Dish < ApplicationRecord
    include DishPresenter
    belongs_to :restaurant
    has_many :order_items
    
    validates :name, :presence => true
    validates :description, :length => { :maximum => 500 }
    
end
