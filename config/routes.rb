Rails.application.routes.draw do
  

  resources :videos
  resources :users
  resources :home
  resources :sessions, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  
  get 'signup', to: 'users#new', as: 'signup'
  get 'login',  to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get 'videos/index'
  get 'videos/show'
  get 'videos/new'
  get 'videos/create'
  get 'videos/edit'
  get 'videos/update'
  get 'videos/destroy'

  #get 'views/create'
  get '/views/:id', to: 'views#create', as: 'create'
  
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'

end
