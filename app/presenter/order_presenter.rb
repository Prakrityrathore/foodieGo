module OrderPresenter
    extend ActiveSupport::Concern

    included do 
        acts_as_api

        api_accessible :base do |t|
            t.add :name
            t.add :quantity
            t.add :price
            t.add :sum
            
      
        end
      
    end
      
end