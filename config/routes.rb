Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :zones, only: [:show] do
    resources :elements, only: [:create, :new]
  end
end
