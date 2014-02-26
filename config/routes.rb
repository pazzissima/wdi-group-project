WdiGroupProject::Application.routes.draw do
  devise_for :users
  resources :users
  root to: "clips#index"

  resources :clips, except: [:update, :edit] do
    resources :comments#, except: [:index, :show]
  end
  post '/clips/update/:id', to: 'clips#like_clicked'

  get '/search', to: 'search#new', as: "new_search"
  post '/search', to: 'search#create'

end