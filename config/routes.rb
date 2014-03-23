Betterbet::Application.routes.draw do
  get '/dashboard', to: 'pages#dashboard'
  get '/stylemaster', to: 'pages#stylemaster'

  get 'auth/:provider/callback', to: 'sessions#facebook_signup'
  get 'logout', to: 'sessions#destroy'
  get 'login', to: 'sessions#new'
  resources :sessions, only: [:create]
  resources :friendships, only: [:create, :destroy]
  resources :users
  resources :goals

  get '/search', to: 'users#search', as: 'search'
  put '/goals/:id/complete', to: 'goals#complete', as: 'complete_goal'
end
