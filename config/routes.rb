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

  authenticated :user do
    root 'users#index', as: :authenticated_user_root
  end

  authenticated :doctor do
    root 'doctors#index', as: :authenticated_doctor_root
  end

  resources :users
  resources :doctors
  resources :appointments
  resources :prescriptions


  match '/404', to: 'errors#not_found', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all


  # Defines the root path route ("/")


  root "home#index"
end
