Rails.application.routes.draw do
  get 'restaurant/:id/dishes' => 'restaurant#dishes', :as => :restaurant_dishes
end
