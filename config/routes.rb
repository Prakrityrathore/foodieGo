Rails.application.routes.draw do
  resources :restaurant do 
    resources :dishes 
  end
  root 'restaurant#index'
end
