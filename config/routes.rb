Rails.application.routes.draw do

  root 'welcome#home'
  
  get '/auth/facebook/callback' => 'sessions#create'

  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  resources :players
  resources :games
  resources :users

end
