Rails.application.routes.draw do
    namespace :admin do
      resources :users
      resources :doctors
      resources :appointments
      resources :categories
      resources :prescriptions
      resources :admin_users

      root to: 'admin_users#index'
    end


  devise_for :admin_users, controllers: {
    sessions: 'admin_users/sessions',
    passwords: 'admin_users/passwords',
    registrations: 'admin_users/registrations',
  }

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
  }


  devise_for :doctors, controllers: {
    sessions: 'doctors/sessions',
    passwords: 'doctors/passwords',
    registrations: 'doctors/registrations',
  }

  authenticated :user do
    root 'users#index', as: :authenticated_user_root
  end

  authenticated :doctor do
    root 'doctors#index', as: :authenticated_doctor_root
  end

  authenticated :admin_user do
    root 'admin/admin_users#index', as: :authenticated_admin_user_root
  end

  resources :users
  resources :doctors
  resources :appointments
  resources :prescriptions
  #resources :admin_users


  match '/404', to: 'errors#not_found', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all


  # Defines the root path route ("/")


  root "home#index"
end
