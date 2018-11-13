Rails.application.routes.draw do

  root 'welcome#home'
  
  get '/auth/facebook/callback' => 'sessions#create'

  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :players, except: [:new, :create, :edit]
  resources :games
  resources :users
  resources :player_season_projections
  resources :teams

  resources :seasons do
    resources :players do 
      resources :player_season_projections, only: [:new, :create]
    end
  end

  # Only Admin can update the data/
  namespace :admin do
    resources :players
    resources :games
    resources :users
    resources :player_season_projections
    resources :teams
  end

end
