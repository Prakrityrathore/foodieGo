module DishPresenter
    extend ActiveSupport::Concern

    included do 
        acts_as_api

        api_accessible :base do |t|
            t.add :name
            t.add :cuisine
            t.add :price
            t.add :ratings
            t.add :description
            t.add :created_at
            t.add :updated_at
            t.add :restaurant,template::base
      
        end
      
    end
      
end