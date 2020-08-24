Rails.application.routes.draw do
  root "pages#home"
  get "about", to: "pages#about"
  resources :articles
  resources :users, except: [:new]
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  get "signup", to: "users#new"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
