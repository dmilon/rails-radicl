Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :farms, only: [:new, :create, :update, :edit, :destroy]

  resources :farms, only: [:show], as: :farm do
    resources :zones, only: [:new, :create, :index]
    member do
      get 'stats', to: 'farms#stats'
    end
  end
  resources :zones, only: [:show, :new, :edit, :update, :destroy] do
    resources :elements, only: [:new, :edit, :create, :update, :destroy]
  end
  resources :actions, only: [:create, :update]

  scope :community, as: :community do
    resources :farms, only: [:index]
  end

  resources :products, only: [:new, :create]
  resources :follows, only: [:create, :update]
end
