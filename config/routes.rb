WdiGroupProject::Application.routes.draw do

  devise_for :users
  resources :users
  root to: "clips#index"

  resources :clips, except: [:update, :edit] do
    resources :comments#, except: [:index, :show]
  end

  post '/clips/update/:id', to: 'clips#like_clicked'
  patch '/clips/:clip_id/playlist/:id', to: 'clips#add_to_playlist'
  post '/clips/playlist/:id', to: 'clips#add_playlist'
  get '/map', to: 'clips#map_clips'


  post '/search', to: 'search#create'

  post '/clips/:id', to: 'clips#snippet'
  get '/clips/:id/snippets', to: 'clips#snippets'

  resources :playlists



end