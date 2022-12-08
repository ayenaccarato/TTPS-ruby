Rails.application.routes.draw do
  resources :turns
  devise_for :users
  resources :users, path: '/users_admin'
  

  resources :localities
  resources :sucursals
    
  resources :horarios

  get 'index/home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "index#home"
end
