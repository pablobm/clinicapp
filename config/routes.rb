Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :doctors
      resources :appointments
      resources :categories
      resources :prescriptions

      root to: "users#index"
    end
  
  devise_for :users
  devise_for :doctors  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
