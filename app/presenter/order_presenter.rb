module OrderPresenter
    extend ActiveSupport::Concern

    included do 
        acts_as_api

        api_accessible :base do |t|
            t.add :delivery_address
            t.add :phone_number

      
        end
      
    end
      
end