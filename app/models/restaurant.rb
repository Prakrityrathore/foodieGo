class Restaurant < ApplicationRecord
    has_many :dishes, dependent: :destroy

    validates :name, :address, :email, :presence => true
    validates :phone_number, :length => { :is => 10 }
end
