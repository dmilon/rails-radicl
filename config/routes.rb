Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :gardens, only: [:new, :create, :update, :edit, :destroy]

  resources :gardens, only: [:show], as: :garden do
    resources :zones, only: [:new, :create, :index]
  end
  resources :zones, only: [:show, :new, :edit] do
    resources :elements, only: [:new; :edit, :create, :update, :delete]
  end
  resources :logs, only: [:create, :update]
end
