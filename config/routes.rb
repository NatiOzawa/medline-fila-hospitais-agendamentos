Rails.application.routes.draw do
  devise_for :users
  root "pages#home"

  resources :appointments do
    collection do
      get "my_appointments", to: "appointments#my_appointments", as: "my_appointments"
      get "history", to: "appointments#history", as: "history"
    end
  end
end
