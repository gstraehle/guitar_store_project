Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'products#index'
  resources :orders do
    resources :charges
  end
  resources :products
  resources :order_products
  devise_for :users
end
