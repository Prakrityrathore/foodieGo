class Order < ApplicationRecord
    include OrderPresenter

    belongs_to :restaurant
    has_many :order_items
    accepts_nested_attributes_for :order_items


    #---------Validations----------
    validates :restaurant_id, presence: true
    #------------------------------

end
