Rails.application.routes.draw do
  resources :orders

  devise_for :users
  root 'products#index'
  resources :products

  get 'orders/:id/checkout', to: 'orders#checkout'

end
