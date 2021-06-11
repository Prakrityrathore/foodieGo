Rails.application.routes.draw do
  resources :restaurant do 
    resources :dishes
    resources :orders
  end
  root 'restaurant#index'
end
