Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :gardens, only: [:new, :edit, :index]
  resources :gardens, only: [:show] do
    resources :zones, only: [:create, :update, :delete]
  end
  resources :zones, only: [:show, :new, :edit] do
    resources :elements, only: [:new; :edit, :create, :update, :delete]
  end
  resources :logs, only: [:create, :update]
end
