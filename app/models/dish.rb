class Dish < ApplicationRecord
    include DishPresenter
    belongs_to :restaurant
    has_many :order_placments
    has_many :orders, through: :order_placments

    validates :name, :presence => true
    validates :description, :length => { :maximum => 500 }
    
end
