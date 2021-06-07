class Dish < ApplicationRecord
    belongs_to :restaurant

    validates :name, :presence => true
    validates :description, :length => { :maximum => 500 }
    
end
