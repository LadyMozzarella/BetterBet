Betterbet::Application.routes.draw do

  root to: "pages#dashboard"
  get '/dashboard', to: 'pages#dashboard'
  get '/stylemaster', to: 'pages#stylemaster'
  get '/users/autocomplete', to: 'users#autocomplete', as: 'autocomplete_users'
  get '/users/:id/goals', to: 'users#goals', as: 'users_goals'

  get '/auth/:provider/callback', to: 'sessions#facebook_signup'
  get '/logout', to: 'sessions#destroy'
  get '/login', to: 'sessions#new'
  get '/signup', to: 'users#new'
  resources :sessions, only: [:create]
  resources :friendships, only: [:create, :destroy]
  resources :users
  resources :goals

  put '/goals/:id/complete', to: 'goals#complete', as: 'complete_goal'

  post '/goals/status', to: 'goals#status'

  mount Soulmate::Server, :at => '/sm'


end
