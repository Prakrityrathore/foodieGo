Rails.application.routes.draw do
  get 'restaurant/:id/dishes' => 'restaurant#index', :as => :restaurant_dishes
end
