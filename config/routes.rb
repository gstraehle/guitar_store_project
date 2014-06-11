Rails.application.routes.draw do
  root 'products#index'
  resources :orders do
    resources :charges
  end
  resources :products
  resources :order_products
  devise_for :users
end
