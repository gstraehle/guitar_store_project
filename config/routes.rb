Rails.application.routes.draw do
  root 'products#index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :orders do
    resources :charges
  end
  resources :products
  resources :order_products
  devise_for :users
end
