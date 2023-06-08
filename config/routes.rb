Rails.application.routes.draw do
  devise_for :users
  root to: "pages#index"
  get "/home", to: "pages#home"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :clinics, only: :index
  resources :users, only: [:new, :create, :edit, :update]
  delete '/logout', to: 'users#logout', as: :logout

  resources :appointments do
    collection do
      get "my_appointments", to: "appointments#my_appointments", as: "my_appointments"
      get "history", to: "appointments#history", as: "history"
    end
  end
end
