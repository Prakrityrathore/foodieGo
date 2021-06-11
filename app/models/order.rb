class Order < ApplicationRecord
    include OrderPresenter

    belongs_to :restaurant
    has_many :order_placments
    has_many :dishes, through: :order_placments

    #---------Validations----------
    validates :sum, presence: true
    validates :restaurant_id, presence: true
    before_validation :set_sum!
    #------------------------------

    def set_sum!
        self.sum = dishes.map(&:price).sum
    end
end
