Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :gardens, only: [:new, :create, :update, :edit, :destroy]

  resources :gardens, only: [:show], as: :garden do
    resources :zones, only: [:new, :create, :index]
    member do
      get 'stats', to: 'gardens#stats'
    end
  end
  resources :zones, only: [:show, :new, :edit, :update, :destroy] do
    resources :elements, only: [:new, :edit, :create, :update, :destroy]
  end
  resources :logs, only: [:create, :update]

  scope :community, as: :community do
    resources :gardens, only: [:index]
  end

  resources :products, only: [:new, :create]
  resources :follows, only: [:create, :update]
end
