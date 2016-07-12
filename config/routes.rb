Rails.application.routes.draw do
  devise_for :users
  root 'shops#index'

  resources :users, only: [:index, :destroy]
  resources :shops do
    resources :reviews, only: [:new, :create, :update, :edit, :destroy]
  end
end
