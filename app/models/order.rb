class Order < ApplicationRecord
    belongs_to :restaurant
    has_many :order_placments
    has_many :dishes, through: :order_placments

    validates :sum, presence: true, numericality: { greater_than_or_equal_to: 0 }
  
    validates :restaurant_id, presence: true
end
