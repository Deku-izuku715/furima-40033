Rails.application.routes.draw do
  devise_for :users
  get '/', to: 'items#index'
  root to: 'items#index'
  resources :users
  resources :items, only: :new
  resources :articles
end