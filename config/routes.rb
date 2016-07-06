Rails.application.routes.draw do
  root 'shops#index'

  resources :shops do
    resources :reviews
  end
end
