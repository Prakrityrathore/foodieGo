class OrderPlacment < ApplicationRecord
    belongs_to :order, inverse_of: :order_placments
    belongs_to :dish, inverse_of: :order_placments
end
