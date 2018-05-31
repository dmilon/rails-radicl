Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :gardens, only: [:new, :create, :update, :edit, :destroy]

  resources :gardens, only: [:show] do
    resources :zones, only: [:new, :create, :index]
    member do
      get 'stats', to: 'gardens#stats'
    end
  end
  resources :zones, only: [:update, :edit, :destroy]

  resources :zones, only: [:show] do
    resources :elements, only: [:new, :create]
  end
  resources :elements, only: [:edit, :update, :destroy]
  resources :logs, only: [:new, :create, :update, :index, :edit]
end
