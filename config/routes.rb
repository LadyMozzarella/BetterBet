Betterbet::Application.routes.draw do

  root to: "dashboard#index"
  get '/dashboard', to: 'dashboard#index'

  get '/users/autocomplete', to: 'users#autocomplete', as: 'autocomplete_users'
  get '/auth/:provider/callback', to: 'sessions#facebook_signup'

  # CHANGE
  get '/users/:id/goals', to: 'users#goals', as: 'users_goals'

  resources :sessions, only: [:create]
  get '/logout', to: 'sessions#destroy'
  get '/login', to: 'sessions#new'

  # UPDATED - GOOD!
  resources :friendships, only: [:create, :destroy]

  resources :users
  get '/signup', to: 'users#new'

  # UPDATED - GOOD!
  resources :goals, except: [:index, :show]
  put '/goals/:id/complete', to: 'goals#complete', as: 'complete_goal'

  mount Soulmate::Server, :at => '/sm'
end
