Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :gardens, only: [:show] do
    resources :zones, only: [:new, :create]
  end
  resources :zones, only: [:show] do
    resources :elements, only: [:create, :new]
  end
end
