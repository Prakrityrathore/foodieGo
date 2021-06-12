module CustomerPresenter
    extend ActiveSupport::Concern

    included do 
        acts_as_api

        api_accessible :base do |t|
            t.add :name
            t.add :phone_number
            t.add :delivery_address
            t.add :payment_method
            t.add :order, template: :base
            
      
        end
      
    end
      
end