Rails.application.routes.draw do
  resources :users
  resources :reservations, only: [:index, :create, :destroy]
  resources :hotels, only: [:index, :show, :create, :destroy]
  post "/auth/login", to: "authentication#login"


  get 'rooms/index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
