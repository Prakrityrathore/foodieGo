class Customer < ApplicationRecord
    has_many :orders, dependent: :destroy

    validates :order_id, presence: true
end
