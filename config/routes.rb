WdiGroupProject::Application.routes.draw do
  devise_for :users
  resources :users
  root to: "clips#index"

  resources :clips, except: [:update, :edit] do
    resources :comments#, except: [:index, :show]
  end

  post '/clips/update/:id', to: 'clips#like_clicked'
  patch '/clips/:clip_id/playlist/:id', to: 'clips#add_to_playlist'

  get '/search', to: 'search#new', as: "new_search"

  post '/', to: 'search#create'

  resources :playlists


end