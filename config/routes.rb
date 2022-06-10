Rails.application.routes.draw do
  resources :orders
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pages#home"
  get "signup", to: "users#new"
  get "login", to: "sessions#new"
  get "login", to: "sessions#index"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  resources :users, except: [:new]
  resources :sessions
end
