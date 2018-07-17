Rails.application.routes.draw do

  root 'welcome#index'

  resources :users

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :dashboard, only: [:index]
  end

end
