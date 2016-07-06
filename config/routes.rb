Rails.application.routes.draw do
  devise_for :users
  root 'shops#index'

  resources :shops do
    resources :reviews
  end
end
