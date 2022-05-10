Rails.application.routes.draw do
  post "/auth/login", to: "authentication#login"

  resources :users
  resources :reservations, only: [:index, :create, :destroy]
  resources :rooms, only: [:index]
  resources :hotels, only: [:index, :show, :create, :destroy]


  root "hotels#index"
end
