class Order < ApplicationRecord
    include OrderPresenter

    serialize :id, :quantity, :sum

    belongs_to :restaurant
    belongs_to :customer
    has_many :order_placments
    has_many :dishes, through: :order_placments

    #---------Validations----------
    validates :sum, presence: true
    validates :restaurant_id, presence: true
    validates :customer_id, presence: true
    before_validation :set_sum!
    #------------------------------

    def set_sum!
        self.sum = dishes.map(&:price).sum
    end
end
