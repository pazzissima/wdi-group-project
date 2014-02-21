WdiGroupProject::Application.routes.draw do
  root to: "clips#index"

  resources :clips, except: [:edit, :update] do
    resources :comments, except: [:index, :show]
  end
end

#this is kai's github test.