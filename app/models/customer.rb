class Customer < ApplicationRecord
    include CustomerPresenter
    has_many :orders, dependent: :destroy

    validates :order_id, presence: true
end
