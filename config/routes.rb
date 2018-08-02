Rails.application.routes.draw do

  root 'welcome#index'

  resources :users

  resources :favorites, only: [:create, :destroy]
  root 'welcome#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :dashboard, only: [:index]
  end

  resources :locations do
    member do
      post 'add_favorite'
      delete 'remove_favorite'
    end
  end

end
