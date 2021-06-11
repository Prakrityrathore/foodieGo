class Restaurant < ApplicationRecord
    include RestaurantPresenter
    has_many :dishes, dependent: :destroy
    has_many :orders, dependent: :destroy

    validates :name, :address, :email, :presence => true
    validates :phone_number, :length => { :is => 10 }
end
