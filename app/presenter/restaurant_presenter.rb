module RestaurantPresenter
    extend ActiveSupport::Concern

    included do 
        acts_as_api

        api_accessible :base do |t|
            t.add :name
            t.add :address
            t.add :opening_hours
            t.add :email
            t.add :accept_reservation 
            t.add :home_deliveries 
            t.add :phone_number
            t.add :created_at
            t.add :updated_at
      
      
        end
      
    end
      
end
