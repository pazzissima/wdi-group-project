WdiGroupProject::Application.routes.draw do
  devise_for :users
  resources :users
  root to: "clips#index"

  resources :clips, except: [:edit, :update] do
    resources :comments#, except: [:index, :show]
  end

  get '/search', to: 'search#new', as: "new_search"
  post '/', to: 'search#create'

end
