Rails.application.routes.draw do
  root 'products#index'
  resources :orders do
    resources :charges
  end

  devise_for :users

  resources :products

  get 'orders/:id/checkout', to: 'orders#checkout'
  patch 'orders/:id/checkout', to: 'orders#convert_cart_to_order', as: 'convert'
  get 'orders/:id/confirmation', to: 'orders#confirmation', as: 'confirmation'

end
