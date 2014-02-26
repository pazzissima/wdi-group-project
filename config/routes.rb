WdiGroupProject::Application.routes.draw do
  get "playlists/index"
  get "playlists/new"
  get "playlists/edit"
  get "playlists/show"
  devise_for :users
  resources :users
  root to: "clips#index"

  resources :clips, except: [:edit, :update] do
    resources :comments#, except: [:index, :show]
  end

  get '/search', to: 'search#new', as: "new_search"
  post '/search', to: 'search#create'

  resources :playlists

end