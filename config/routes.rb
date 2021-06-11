Rails.application.routes.draw do
  resources :restaurant do 
    resources :dishes
    resources :orders, :only => [:index, :show]
  end
  root 'restaurant#index'
end
