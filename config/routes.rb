Rails.application.routes.draw do
  resources :sucursals do
    member do 
      get :nuevo_horario
      post :crear_horario
      get :horarios
    end
  end
  devise_for :users
  resources :users do
    member do
      post :crear
    end
  end
  
  get 'index/home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "index#home"
end