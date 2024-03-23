Rails.application.routes.draw do
  devise_for :users
  get '/', to: 'items#index'
  post 'items/new', to: 'items#create'
  root to: 'items#index'
  resources :users
  resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy]
end