WdiGroupProject::Application.routes.draw do
  devise_for :users
  root to: "clips#index"

  resources :clips, except: [:edit, :update] do
    resources :comments, except: [:index, :show]
  end
end

#this is kai's github test.