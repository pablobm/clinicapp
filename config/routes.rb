Rails.application.routes.draw do
  
  namespace :admin do
      resources :users
      resources :doctors

      root to: "users#index"
    end
  devise_for :admin_users
  devise_for :users
  devise_for :doctors  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
