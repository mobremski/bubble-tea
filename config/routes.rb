Rails.application.routes.draw do
  devise_for :users
  root 'shops#index'

  resources :users, only: [:index, :destroy]
  resources :shops do
    resources :reviews, only: [:new, :create, :update, :edit, :destroy]
  end
  resources :reviews do
    resources :votes, only: [:create]
  end
  namespace :api do
    resources :shops, only: [:index]
  end
end
