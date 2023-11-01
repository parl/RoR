Rails.application.routes.draw do
  namespace :api do
    get 'books/index'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
  registrations: 'users/registrations'
  }

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  resources :books, only: [:index, :new, :create]
  # Defines the root path route ("/")
  root "books#index"
end
