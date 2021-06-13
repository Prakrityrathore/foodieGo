class OrderItem < ApplicationRecord
    belongs_to :order
    belongs_to :dish

    before_validation :set_sum!

    def set_sum!
        self.total_price = dishes.map(&:price).sum
    end
end
