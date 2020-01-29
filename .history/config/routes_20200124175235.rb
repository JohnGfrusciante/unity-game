Rails.application.routes.draw do
  devise_for :users
  root to: 'messages#index'
  resources :users, only: [:index, :new, :create, :edit, :update]
  resources :messages, only: [:index, :create, :show, :edit, :update, :destroy] do
end
