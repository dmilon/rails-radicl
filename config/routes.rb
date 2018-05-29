Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :gardens, only: [:show] do
    resources :zones, only: [:new, :create, :index]
  end
  resources :zones, only: [:show] do
    resources :elements, only: [:create, :new]
  end
  resources :logs, only: [:show, :index, :new, :create]
end
