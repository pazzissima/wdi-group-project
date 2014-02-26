WdiGroupProject::Application.routes.draw do
  get "playlists/index"
  get "playlists/new"
  get "playlists/edit"
  get "playlists/show"
  devise_for :users
  resources :users
  root to: "clips#index"

  resources :clips, except: [:update, :edit] do
    resources :comments#, except: [:index, :show]
  end
  post '/clips/update/:id', to: 'clips#like_clicked'
  get '/clips/playlist/:id', to: 'clips#add_playlist'

  get '/search', to: 'search#new', as: "new_search"

  post '/', to: 'search#create'

  #resources :playlists


end