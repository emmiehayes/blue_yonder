Rails.application.routes.draw do

  resources :users

  get '/signup', to: 'users#new'
  get '/logout', to: 'sessions#destroy'
  get '/login',  to: 'sessions#new'
  post '/login', to: 'sessions#create'
end
