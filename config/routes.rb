Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
<<<<<<< HEAD
  delete '/sair', to: 'sessions#destroy', as: :sair
=======

  resources :appointments do
    collection do
      get "my_appointments"
      get "history"
    end
  end
>>>>>>> master
end
