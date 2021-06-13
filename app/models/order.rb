class Order < ApplicationRecord
    include OrderPresenter

    belongs_to :restaurant
    has_many :order_items


    #---------Validations----------
    validates :sum, presence: true
    validates :restaurant_id, presence: true
    #------------------------------

end
