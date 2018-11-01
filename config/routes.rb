Rails.application.routes.draw do

  root 'welcome#home'
  
  get '/auth/facebook/callback' => 'sessions#create'

  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :players
  resources :games
  resources :users
  resources :player_season_projections
  resources :teams

  resources :seasons do
    resources :players
  end

end
