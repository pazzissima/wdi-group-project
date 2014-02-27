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

  post '/', to: 'search#create'
  post '/users/:id', to: 'search#create'
  post '/users/:id/edit', to: 'search#create'
  post 'clips/:id', to: 'search#create'
  post 'clips', to: 'search#create'

  resources :playlists

end